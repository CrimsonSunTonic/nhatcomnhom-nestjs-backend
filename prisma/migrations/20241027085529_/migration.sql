-- CreateTable
CREATE TABLE "tbl_employees" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "username" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "password" TEXT NOT NULL,
    "role" INTEGER NOT NULL DEFAULT 0,

    CONSTRAINT "tbl_employees_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "tbl_checkinout" (
    "check_id" SERIAL NOT NULL,
    "user_id" INTEGER NOT NULL,
    "action" TEXT NOT NULL,
    "check_time" TIMESTAMP(3),
    "latitude" TEXT,
    "longitude" TEXT,
    "remote" INTEGER NOT NULL DEFAULT 0,

    CONSTRAINT "tbl_checkinout_pkey" PRIMARY KEY ("check_id")
);

-- CreateTable
CREATE TABLE "tbl_work_location" (
    "id" SERIAL NOT NULL,
    "latitude" TEXT,
    "longitude" TEXT,
    "radiusinmeters" TEXT,

    CONSTRAINT "tbl_work_location_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE INDEX "tbl_checkinout_user_id_idx" ON "tbl_checkinout"("user_id");

-- CreateIndex
CREATE INDEX "tbl_checkinout_latitude_idx" ON "tbl_checkinout"("latitude");
