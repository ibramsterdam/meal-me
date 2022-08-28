-- CreateTable
CREATE TABLE `Meal` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(191) NOT NULL,
    `description` VARCHAR(191) NULL,
    `protein` DOUBLE NOT NULL,
    `fat` DOUBLE NOT NULL,
    `carbohydrate` DOUBLE NOT NULL,
    `calories` DOUBLE NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Ingredient` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(191) NOT NULL,
    `description` VARCHAR(191) NOT NULL,
    `protein` DOUBLE NOT NULL,
    `fat` DOUBLE NOT NULL,
    `carbohydrate` DOUBLE NOT NULL,
    `calories` DOUBLE NOT NULL,
    `weight` INTEGER NOT NULL,
    `mealId` INTEGER NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
