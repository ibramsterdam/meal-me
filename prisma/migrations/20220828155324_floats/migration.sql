/*
  Warnings:

  - You are about to alter the column `calories` on the `Ingredient` table. The data in that column could be lost. The data in that column will be cast from `Decimal` to `Float`.
  - You are about to alter the column `carbohydrate` on the `Ingredient` table. The data in that column could be lost. The data in that column will be cast from `Decimal` to `Float`.
  - You are about to alter the column `fat` on the `Ingredient` table. The data in that column could be lost. The data in that column will be cast from `Decimal` to `Float`.
  - You are about to alter the column `protein` on the `Ingredient` table. The data in that column could be lost. The data in that column will be cast from `Decimal` to `Float`.
  - You are about to alter the column `weight` on the `Ingredient` table. The data in that column could be lost. The data in that column will be cast from `Int` to `Float`.
  - You are about to alter the column `calories` on the `Meal` table. The data in that column could be lost. The data in that column will be cast from `Decimal` to `Float`.
  - You are about to alter the column `carbohydrate` on the `Meal` table. The data in that column could be lost. The data in that column will be cast from `Decimal` to `Float`.
  - You are about to alter the column `fat` on the `Meal` table. The data in that column could be lost. The data in that column will be cast from `Decimal` to `Float`.
  - You are about to alter the column `protein` on the `Meal` table. The data in that column could be lost. The data in that column will be cast from `Decimal` to `Float`.

*/
-- RedefineTables
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_Ingredient" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "name" TEXT NOT NULL,
    "description" TEXT NOT NULL,
    "protein" REAL NOT NULL,
    "fat" REAL NOT NULL,
    "carbohydrate" REAL NOT NULL,
    "calories" REAL NOT NULL,
    "weight" REAL NOT NULL,
    "mealId" INTEGER,
    CONSTRAINT "Ingredient_mealId_fkey" FOREIGN KEY ("mealId") REFERENCES "Meal" ("id") ON DELETE SET NULL ON UPDATE CASCADE
);
INSERT INTO "new_Ingredient" ("calories", "carbohydrate", "description", "fat", "id", "mealId", "name", "protein", "weight") SELECT "calories", "carbohydrate", "description", "fat", "id", "mealId", "name", "protein", "weight" FROM "Ingredient";
DROP TABLE "Ingredient";
ALTER TABLE "new_Ingredient" RENAME TO "Ingredient";
CREATE TABLE "new_Meal" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "name" TEXT NOT NULL,
    "description" TEXT,
    "protein" REAL NOT NULL,
    "fat" REAL NOT NULL,
    "carbohydrate" REAL NOT NULL,
    "calories" REAL NOT NULL
);
INSERT INTO "new_Meal" ("calories", "carbohydrate", "description", "fat", "id", "name", "protein") SELECT "calories", "carbohydrate", "description", "fat", "id", "name", "protein" FROM "Meal";
DROP TABLE "Meal";
ALTER TABLE "new_Meal" RENAME TO "Meal";
PRAGMA foreign_key_check;
PRAGMA foreign_keys=ON;
