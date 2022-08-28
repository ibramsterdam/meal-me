/*
  Warnings:

  - Added the required column `weight` to the `Product` table without a default value. This is not possible if the table is not empty.

*/
-- RedefineTables
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_Product" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "name" TEXT NOT NULL,
    "description" TEXT NOT NULL,
    "protein" DECIMAL NOT NULL,
    "fat" DECIMAL NOT NULL,
    "carbohydrate" DECIMAL NOT NULL,
    "calories" DECIMAL NOT NULL,
    "weight" INTEGER NOT NULL
);
INSERT INTO "new_Product" ("calories", "carbohydrate", "description", "fat", "id", "name", "protein") SELECT "calories", "carbohydrate", "description", "fat", "id", "name", "protein" FROM "Product";
DROP TABLE "Product";
ALTER TABLE "new_Product" RENAME TO "Product";
PRAGMA foreign_key_check;
PRAGMA foreign_keys=ON;
