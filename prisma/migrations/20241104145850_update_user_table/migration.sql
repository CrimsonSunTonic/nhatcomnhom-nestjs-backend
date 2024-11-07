/*
  Warnings:

  - You are about to drop the column `name` on the `users` table. All the data in the column will be lost.
  - You are about to drop the column `password` on the `users` table. All the data in the column will be lost.
  - You are about to drop the column `username` on the `users` table. All the data in the column will be lost.
  - Added the required column `hash` to the `users` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "users" DROP COLUMN "name",
DROP COLUMN "password",
DROP COLUMN "username",
ADD COLUMN     "firstname" TEXT,
ADD COLUMN     "hash" TEXT NOT NULL,
ADD COLUMN     "lastname" TEXT;
