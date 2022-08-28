-- CreateTable
CREATE TABLE "Meals" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "name" TEXT NOT NULL,
    "protein" DECIMAL NOT NULL,
    "fat" DECIMAL NOT NULL,
    "carbohydrate" DECIMAL NOT NULL,
    "calories" DECIMAL NOT NULL
);
