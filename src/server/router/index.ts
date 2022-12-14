// src/server/router/index.ts
import { createRouter } from "./context";
import superjson from "superjson";

import { mealRouter } from "./meal";

export const appRouter = createRouter()
  .transformer(superjson)
  .merge("meal.", mealRouter);

// export type definition of API
export type AppRouter = typeof appRouter;
