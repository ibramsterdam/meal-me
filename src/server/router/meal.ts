import { createRouter } from "./context";
import { z } from "zod";

export const mealRouter = createRouter().query("getAll", {
  async resolve({ ctx }) {
    return await ctx.prisma.meal.findMany({
      include: {
        ingredients: true,
      },
    });
  },
});
