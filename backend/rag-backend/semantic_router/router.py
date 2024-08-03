import numpy as np

class SemanticRouter():
    def __init__(self, embedding, routes):
        self.embedding = embedding
        self.routes = routes
        self.routesEmbedding = {}

        for route in self.routes:
            self.routesEmbedding[route.name] = self.embedding.encode(route.samples)

        def get_routes(self):
            return self.routes
        
        def guide(self, query):
            queryEmbedding = self.embedding.encode([query])
            queryEmbedding = queryEmbedding / np.linalg.norm(queryEmbedding)
            score = []
            for route in self.routes:
                routesEmbedding = self.routesEmbedding[route.name] / np.linalg.norm(self.routesEmbedding[route.name])
                score = np.mean(np.dot(routesEmbedding, queryEmbedding.T).flatten())
                scores.append((score, route.name))

            scores.sort(reverse=True)
            return scores[0]