/*
  Warnings:

  - You are about to drop the `Product` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `ProductsOnMeals` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropTable
PRAGMA foreign_keys=off;
DROP TABLE "Product";
PRAGMA foreign_keys=on;

-- DropTable
PRAGMA foreign_keys=off;
DROP TABLE "ProductsOnMeals";
PRAGMA foreign_keys=on;

-- CreateTable
CREATE TABLE "MealProduct" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "name" TEXT NOT NULL,
    "description" TEXT NOT NULL,
    "protein" DECIMAL NOT NULL,
    "fat" DECIMAL NOT NULL,
    "carbohydrate" DECIMAL NOT NULL,
    "calories" DECIMAL NOT NULL,
    "weight" INTEGER NOT NULL,
    "mealId" INTEGER,
    CONSTRAINT "MealProduct_mealId_fkey" FOREIGN KEY ("mealId") REFERENCES "Meal" ("id") ON DELETE SET NULL ON UPDATE CASCADE
);

-- RedefineTables
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_Meal" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "name" TEXT NOT NULL,
    "description" TEXT,
    "protein" DECIMAL NOT NULL,
    "fat" DECIMAL NOT NULL,
    "carbohydrate" DECIMAL NOT NULL,
    "calories" DECIMAL NOT NULL
);
INSERT INTO "new_Meal" ("calories", "carbohydrate", "description", "fat", "id", "name", "protein") SELECT "calories", "carbohydrate", "description", "fat", "id", "name", "protein" FROM "Meal";
DROP TABLE "Meal";
ALTER TABLE "new_Meal" RENAME TO "Meal";
PRAGMA foreign_key_check;
PRAGMA foreign_keys=ON;
