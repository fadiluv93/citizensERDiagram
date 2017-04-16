CREATE TABLE IF NOT EXISTS `CitizenScheduler`.`Reservation` (
  `idReservation` INT NOT NULL AUTO_INCREMENT,
  `ReservationID` VARCHAR(45) NOT NULL,
  `RoomNumber` VARCHAR(45) NOT NULL,
  `Email` VARCHAR(45) NOT NULL,
  `StartReservation` VARCHAR(45) NOT NULL,
  `EndReservation` VARCHAR(45) NOT NULL,
  `Comments` VARCHAR(45) NULL,
  PRIMARY KEY (`idReservation`, `ReservationID`, `RoomNumber`, `Email`))
ENGINE = InnoDB

CREATE TABLE IF NOT EXISTS `CitizenScheduler`.`Room` (
  `idRoom` INT NULL,
  `RoomNumber` VARCHAR(45) NOT NULL,
  `RoomName` VARCHAR(45) NOT NULL,
  `Reservation_idReservation` INT NOT NULL,
  `Reservation_ReservationID` VARCHAR(45) NOT NULL,
  `Reservation_RoomNumber` VARCHAR(45) NOT NULL,
  `Reservation_Email` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idRoom`, `RoomNumber`),
  INDEX `fk_Room_Reservation_idx` (`Reservation_idReservation` ASC, `Reservation_ReservationID` ASC, `Reservation_RoomNumber` ASC, `Reservation_Email` ASC),
  CONSTRAINT `fk_Room_Reservation`
    FOREIGN KEY (`Reservation_idReservation` , `Reservation_ReservationID` , `Reservation_RoomNumber` , `Reservation_Email`)
    REFERENCES `CitizenScheduler`.`Reservation` (`idReservation` , `ReservationID` , `RoomNumber` , `Email`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB

CREATE TABLE IF NOT EXISTS `CitizenScheduler`.`User` (
  `idUser` INT NOT NULL,
  `Email` VARCHAR(45) NOT NULL,
  `FirstName` VARCHAR(45) NOT NULL,
  `LastName` VARCHAR(45) NOT NULL,
  `LastName` VARCHAR(45) NOT NULL,
  `Role` VARCHAR(45) NOT NULL,
  `Password` VARCHAR(45) NOT NULL,
  `Room_idRoom` INT NOT NULL,
  `Room_RoomNumber` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Email`),
  INDEX `fk_User_Room1_idx` (`Room_idRoom` ASC, `Room_RoomNumber` ASC),
  CONSTRAINT `fk_User_Room1`
    FOREIGN KEY (`Room_idRoom` , `Room_RoomNumber`)
    REFERENCES `CitizenScheduler`.`Room` (`idRoom` , `RoomNumber`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB

CREATE TABLE IF NOT EXISTS `CitizenScheduler`.`timestamps` (
  `create_time` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` TIMESTAMP NULL)