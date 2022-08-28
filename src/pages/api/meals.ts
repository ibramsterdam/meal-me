// src/pages/api/examples.ts
import type { NextApiRequest, NextApiResponse } from "next";
import { prisma } from "../../server/db/client";

const meals = async (req: NextApiRequest, res: NextApiResponse) => {
  const meals = await prisma.meal.findMany();
  res.status(200).json(meals);
};

export default meals;
