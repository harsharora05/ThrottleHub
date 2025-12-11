/*
  Warnings:

  - You are about to drop the `Admin` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropTable
DROP TABLE "Admin";

-- CreateTable
CREATE TABLE "Seller" (
    "s_id" SERIAL NOT NULL,
    "email" TEXT NOT NULL,
    "password" TEXT NOT NULL,

    CONSTRAINT "Seller_pkey" PRIMARY KEY ("s_id")
);

-- CreateTable
CREATE TABLE "Bike_Product" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "year" TEXT NOT NULL,
    "km_driven" INTEGER NOT NULL,
    "specs" TEXT NOT NULL,
    "description" TEXT NOT NULL,
    "isSecondHand" BOOLEAN NOT NULL DEFAULT false,
    "price" INTEGER NOT NULL,
    "discount" INTEGER NOT NULL,
    "images" TEXT[],
    "seller_id" INTEGER NOT NULL,

    CONSTRAINT "Bike_Product_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Accessory_Product" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "specs" TEXT NOT NULL,
    "description" TEXT NOT NULL,
    "price" INTEGER NOT NULL,
    "discount" INTEGER NOT NULL,
    "images" TEXT[],
    "seller_id" INTEGER NOT NULL,

    CONSTRAINT "Accessory_Product_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "Seller_email_key" ON "Seller"("email");

-- AddForeignKey
ALTER TABLE "Bike_Product" ADD CONSTRAINT "Bike_Product_seller_id_fkey" FOREIGN KEY ("seller_id") REFERENCES "Seller"("s_id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Accessory_Product" ADD CONSTRAINT "Accessory_Product_seller_id_fkey" FOREIGN KEY ("seller_id") REFERENCES "Seller"("s_id") ON DELETE CASCADE ON UPDATE CASCADE;
