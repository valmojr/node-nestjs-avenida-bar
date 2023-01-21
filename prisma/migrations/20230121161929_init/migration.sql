/*
  Warnings:

  - You are about to drop the column `MenuItemIds` on the `Order` table. All the data in the column will be lost.
  - You are about to drop the column `WaiterId` on the `Order` table. All the data in the column will be lost.
  - You are about to alter the column `status` on the `Order` table. The data in that column could be lost. The data in that column will be cast from `String` to `Boolean`.
  - You are about to drop the column `orderIds` on the `Table` table. All the data in the column will be lost.
  - You are about to drop the column `pendentOrders` on the `Waiter` table. All the data in the column will be lost.
  - Added the required column `waiterId` to the `Order` table without a default value. This is not possible if the table is not empty.

*/
-- RedefineTables
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_MenuItem" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "name" TEXT NOT NULL,
    "value" REAL NOT NULL,
    "orderId" INTEGER,
    CONSTRAINT "MenuItem_orderId_fkey" FOREIGN KEY ("orderId") REFERENCES "Order" ("id") ON DELETE SET NULL ON UPDATE CASCADE
);
INSERT INTO "new_MenuItem" ("id", "name", "value") SELECT "id", "name", "value" FROM "MenuItem";
DROP TABLE "MenuItem";
ALTER TABLE "new_MenuItem" RENAME TO "MenuItem";
CREATE TABLE "new_Order" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "tableId" INTEGER NOT NULL,
    "status" BOOLEAN NOT NULL DEFAULT false,
    "waiterId" INTEGER NOT NULL,
    CONSTRAINT "Order_waiterId_fkey" FOREIGN KEY ("waiterId") REFERENCES "Waiter" ("id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "Order_tableId_fkey" FOREIGN KEY ("tableId") REFERENCES "Table" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);
INSERT INTO "new_Order" ("id", "status", "tableId") SELECT "id", "status", "tableId" FROM "Order";
DROP TABLE "Order";
ALTER TABLE "new_Order" RENAME TO "Order";
CREATE TABLE "new_Table" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "location" TEXT NOT NULL,
    "balance" REAL NOT NULL
);
INSERT INTO "new_Table" ("balance", "id", "location") SELECT "balance", "id", "location" FROM "Table";
DROP TABLE "Table";
ALTER TABLE "new_Table" RENAME TO "Table";
CREATE TABLE "new_Waiter" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "name" TEXT NOT NULL,
    "passcode" TEXT NOT NULL,
    "tips" REAL NOT NULL
);
INSERT INTO "new_Waiter" ("id", "name", "passcode", "tips") SELECT "id", "name", "passcode", "tips" FROM "Waiter";
DROP TABLE "Waiter";
ALTER TABLE "new_Waiter" RENAME TO "Waiter";
PRAGMA foreign_key_check;
PRAGMA foreign_keys=ON;
