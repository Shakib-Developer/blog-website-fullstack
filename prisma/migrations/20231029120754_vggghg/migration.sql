/*
  Warnings:

  - You are about to drop the column `user_id` on the `categories` table. All the data in the column will be lost.
  - You are about to drop the `customers` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `invoice_products` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `invoices` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `products` table. If the table is not empty, all the data it contains will be lost.
  - A unique constraint covering the columns `[name]` on the table `categories` will be added. If there are existing duplicate values, this will fail.

*/
-- DropForeignKey
ALTER TABLE `categories` DROP FOREIGN KEY `categories_user_id_fkey`;

-- DropForeignKey
ALTER TABLE `customers` DROP FOREIGN KEY `customers_user_id_fkey`;

-- DropForeignKey
ALTER TABLE `invoice_products` DROP FOREIGN KEY `invoice_products_invoice_id_fkey`;

-- DropForeignKey
ALTER TABLE `invoice_products` DROP FOREIGN KEY `invoice_products_product_id_fkey`;

-- DropForeignKey
ALTER TABLE `invoice_products` DROP FOREIGN KEY `invoice_products_user_id_fkey`;

-- DropForeignKey
ALTER TABLE `invoices` DROP FOREIGN KEY `invoices_customer_id_fkey`;

-- DropForeignKey
ALTER TABLE `invoices` DROP FOREIGN KEY `invoices_user_id_fkey`;

-- DropForeignKey
ALTER TABLE `products` DROP FOREIGN KEY `products_category_id_fkey`;

-- DropForeignKey
ALTER TABLE `products` DROP FOREIGN KEY `products_user_id_fkey`;

-- AlterTable
ALTER TABLE `categories` DROP COLUMN `user_id`,
    MODIFY `name` VARCHAR(100) NOT NULL;

-- DropTable
DROP TABLE `customers`;

-- DropTable
DROP TABLE `invoice_products`;

-- DropTable
DROP TABLE `invoices`;

-- DropTable
DROP TABLE `products`;

-- CreateTable
CREATE TABLE `socials` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `facebook` VARCHAR(200) NOT NULL,
    `youtube` VARCHAR(200) NOT NULL,
    `twitter` VARCHAR(200) NOT NULL,
    `linkedin` VARCHAR(200) NOT NULL,
    `about` TEXT NOT NULL,
    `address` TEXT NOT NULL,
    `createdAt` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
    `updatedAt` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `subscribers` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `email` VARCHAR(100) NOT NULL,
    `createdAt` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
    `updatedAt` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),

    UNIQUE INDEX `subscribers_email_key`(`email`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `news_list` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `title` VARCHAR(100) NOT NULL,
    `short_des` VARCHAR(400) NOT NULL,
    `img1` VARCHAR(300) NOT NULL,
    `img2` VARCHAR(300) NOT NULL,
    `img3` VARCHAR(300) NOT NULL,
    `img4` VARCHAR(300) NOT NULL,
    `keywords` VARCHAR(300) NOT NULL,
    `long_des` LONGTEXT NOT NULL,
    `type` VARCHAR(200) NOT NULL,
    `catID` INTEGER NOT NULL,
    `createdAt` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
    `updatedAt` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateIndex
CREATE UNIQUE INDEX `categories_name_key` ON `categories`(`name`);

-- AddForeignKey
ALTER TABLE `news_list` ADD CONSTRAINT `news_list_catID_fkey` FOREIGN KEY (`catID`) REFERENCES `categories`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;
