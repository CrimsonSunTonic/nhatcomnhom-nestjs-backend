/*
  Warnings:

  - You are about to drop the `tbl_checkinout` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `tbl_employees` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `tbl_work_location` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropTable
DROP TABLE "tbl_checkinout";

-- DropTable
DROP TABLE "tbl_employees";

-- DropTable
DROP TABLE "tbl_work_location";

-- CreateTable
CREATE TABLE "users" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "username" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "password" TEXT NOT NULL,
    "role" TEXT NOT NULL DEFAULT 'engineer',

    CONSTRAINT "users_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "attendance" (
    "check_id" SERIAL NOT NULL,
    "user_id" INTEGER NOT NULL,
    "action" TEXT NOT NULL,
    "check_time" TIMESTAMP(3),
    "latitude" TEXT,
    "longitude" TEXT,
    "remote" INTEGER NOT NULL DEFAULT 0,

    CONSTRAINT "attendance_pkey" PRIMARY KEY ("check_id")
);

-- CreateTable
CREATE TABLE "work_location" (
    "id" SERIAL NOT NULL,
    "latitude" TEXT,
    "longitude" TEXT,
    "radiusinmeters" TEXT,

    CONSTRAINT "work_location_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE INDEX "attendance_user_id_idx" ON "attendance"("user_id");

-- CreateIndex
CREATE INDEX "attendance_latitude_idx" ON "attendance"("latitude");
