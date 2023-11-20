import { Router } from "../deps.js";

const router = new Router();

router.get("/", (context) => {
  context.response.body = "Welcome to Asm's Quotidien API!";
});

export default router;