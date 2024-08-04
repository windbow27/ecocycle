<template>
    <div class="relative max-w-2xl">
        <i class="fas fa-magnifying-glass absolute left-4 top-1/2 transform -translate-y-1/2"></i>
        <input type="text" placeholder="Search..." v-model="query" ref="searchInput" @keydown="handleKeydown"
            class="input w-full input-bordered input-success pl-10 pr-10 focus:outline-none focus:ring-0" />
        <div class="absolute right-4 top-1/2 transform -translate-y-1/2 flex space-x-4">
            <label for="file-input" class="cursor-pointer">
                <i class="fa-regular fa-image"></i>
            </label>
            <button @click="openModal">
                <i class="fas fa-camera"></i>
            </button>
        </div>
        <input id="file-input" type="file" accept="image/*" class="hidden" @change="handleImageInput" />


        <dialog id="my_modal_3" class="modal" ref="modalRef">
            <div class="modal-box w-11/12 max-w-5xl">
                <form method="dialog">
                    <button class="btn btn-sm btn-circle btn-ghost absolute right-2 top-2"
                        @click="closeModal">✕</button>
                </form>
                <h3 class="text-lg font-bold">Camera</h3>

                <div id="el">
                    <div class="flex justify-center"><video ref="videoRef" width="640" height="480" autoplay></video>
                    </div>
                    <canvas class="invisible-canvas" ref="canvasRef" width="640" height="480"></canvas>
                </div>

                <div class="flex justify-center pt-4"><button class="btn" @click="capture">Capture</button></div>
            </div>
        </dialog>
    </div>
</template>

<script setup lang="ts">

const searchInput = ref(null);
const query = ref('');
const router = useRouter();
const modalRef = ref(null);

const handleKeydown = (event: KeyboardEvent) => {
    if (event.key === 'Enter') {
        if (query.value) {
            router.push({ path: '/search', query: { q: query.value } });
        }
    }
};

const handleImageInput = async (event: Event) => {
    const fileInput = event.target as HTMLInputElement;
    const file = fileInput?.files?.[0];
    const formData = new FormData();
    formData.append('file', file as Blob);

    const response = await fetch('/img_object_detection_to_img', {
        method: 'POST',
        headers: {
            'Accept': 'application/json',
        },
        body: formData,
    });

    if (!response.ok) {
        console.error('Upload failed');
        return;
    }

    query.value = response.headers.get('detected-labels') ?? '';
    handleKeydown({ key: 'Enter' } as KeyboardEvent);

    fileInput.value = '';
};

const videoRef = ref(null);
const canvasRef = ref(null);

const capture = () => {
    if (!videoRef.value || !canvasRef.value) {
        return;
    }

    const context = (canvasRef.value as HTMLCanvasElement).getContext('2d');

    if (!context) {
        return;
    }

    context.drawImage(videoRef.value, 0, 0, 640, 480);
    const dataUrl = (canvasRef.value as HTMLCanvasElement).toDataURL('image/png');

    fetch(dataUrl)
        .then(res => res.blob())
        .then(blob => {
            const file = new File([blob], "captured.png", { type: "image/png" });
            const pseudoEvent = {
                target: {
                    files: [file]
                }
            };
            handleImageInput(pseudoEvent as any);
            closeModal();
        });
};

const openModal = async () => {
    if (navigator.mediaDevices && navigator.mediaDevices.getUserMedia) {
        const stream = await navigator.mediaDevices.getUserMedia({ video: true, audio: false });
        if (videoRef.value) {
            (videoRef.value as HTMLVideoElement).srcObject = stream;
            (videoRef.value as HTMLVideoElement).play();
        }
    }
    // @ts-ignore
    modalRef.value.showModal();
};


const closeModal = () => {
    if (videoRef.value) {
        const stream = (videoRef.value as HTMLVideoElement).srcObject as MediaStream;
        const tracks = stream.getTracks();

        tracks.forEach((track) => {
            track.stop();
        });

        (videoRef.value as HTMLVideoElement).srcObject = null;
    }

    // @ts-ignore
    modalRef.value.close();
};
</script>

<style scoped>
.invisible-canvas {
  position: absolute;
  width: 0;
  height: 0;
  visibility: hidden;
}
</style>