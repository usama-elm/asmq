import { Application } from "./deps.js";
import router from "./api/router.js";

const app = new Application();
const PORT = 8000;

app.use(router.routes());
app.use(router.allowedMethods());

console.log(`Server running on http://localhost:${PORT}`);
app.listen({ port: PORT });