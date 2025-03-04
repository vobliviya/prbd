-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`director`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`director` (
  `#DIRECTOR` INT NOT NULL,
  `dirname` VARCHAR(25) NOT NULL,
  `facult` VARCHAR(10) NOT NULL,
  `directorcol` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`#DIRECTOR`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`group`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`group` (
  `#gr` CHAR(10) NOT NULL,
  `profil` MEDIUMTEXT NULL,
  `nAPR` MEDIUMTEXT NOT NULL,
  PRIMARY KEY (`#gr`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`student`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`student` (
  `idstudent` INT NOT NULL,
  `studentcol` VARCHAR(45) NOT NULL,
  `director_#DIRECTOR` INT NOT NULL,
  `group_#gr` CHAR(10) NULL,
  PRIMARY KEY (`idstudent`),
  INDEX `fk_student_director_idx` (`director_#DIRECTOR` ASC) VISIBLE,
  INDEX `fk_student_group1_idx` (`group_#gr` ASC) VISIBLE,
  CONSTRAINT `fk_student_director`
    FOREIGN KEY (`director_#DIRECTOR`)
    REFERENCES `mydb`.`director` (`#DIRECTOR`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_student_group1`
    FOREIGN KEY (`group_#gr`)
    REFERENCES `mydb`.`group` (`#gr`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`post`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`post` (
  `#postname` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`#postname`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`employee`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`employee` (
  `#emplyee` INT NOT NULL,
  `empname` VARCHAR(25) NOT NULL,
  `director_#DIRECTOR` INT NOT NULL,
  `post_#postname` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`#emplyee`),
  INDEX `fk_employee_director1_idx` (`director_#DIRECTOR` ASC) VISIBLE,
  INDEX `fk_employee_post1_idx` (`post_#postname` ASC) VISIBLE,
  CONSTRAINT `fk_employee_director1`
    FOREIGN KEY (`director_#DIRECTOR`)
    REFERENCES `mydb`.`director` (`#DIRECTOR`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_employee_post1`
    FOREIGN KEY (`post_#postname`)
    REFERENCES `mydb`.`post` (`#postname`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`subject`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`subject` (
  `subjectname` VARCHAR(85) NOT NULL,
  `subinfo` MEDIUMTEXT NULL,
  PRIMARY KEY (`subjectname`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`lessontype`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`lessontype` (
  `lessonname` VARCHAR(12) NOT NULL,
  PRIMARY KEY (`lessonname`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`employee_has_subject`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`employee_has_subject` (
  `employee_#emplyee` INT NOT NULL,
  `subject_subjectname` VARCHAR(85) NOT NULL,
  PRIMARY KEY (`employee_#emplyee`, `subject_subjectname`),
  INDEX `fk_employee_has_subject_subject1_idx` (`subject_subjectname` ASC) VISIBLE,
  INDEX `fk_employee_has_subject_employee1_idx` (`employee_#emplyee` ASC) VISIBLE,
  CONSTRAINT `fk_employee_has_subject_employee1`
    FOREIGN KEY (`employee_#emplyee`)
    REFERENCES `mydb`.`employee` (`#emplyee`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_employee_has_subject_subject1`
    FOREIGN KEY (`subject_subjectname`)
    REFERENCES `mydb`.`subject` (`subjectname`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`schedule`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`schedule` (
  `#week` INT NOT NULL,
  `day` CHAR(3) NOT NULL,
  `subject_subjectname` VARCHAR(85) NOT NULL,
  `lessontype_lessonname` VARCHAR(12) NOT NULL,
  `#room` CHAR(3) NOT NULL,
  `group_#gr` CHAR(10) NOT NULL,
  PRIMARY KEY (`#week`, `day`, `subject_subjectname`, `lessontype_lessonname`, `group_#gr`),
  INDEX `fk_group_has_subject_subject1_idx` (`subject_subjectname` ASC) VISIBLE,
  INDEX `fk_group_has_subject_group1_idx` (`group_#gr` ASC) VISIBLE,
  INDEX `fk_group_has_subject_lessontype1_idx` (`lessontype_lessonname` ASC) VISIBLE,
  CONSTRAINT `fk_group_has_subject_group1`
    FOREIGN KEY (`group_#gr`)
    REFERENCES `mydb`.`group` (`#gr`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_group_has_subject_subject1`
    FOREIGN KEY (`subject_subjectname`)
    REFERENCES `mydb`.`subject` (`subjectname`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_group_has_subject_lessontype1`
    FOREIGN KEY (`lessontype_lessonname`)
    REFERENCES `mydb`.`lessontype` (`lessonname`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`vedomost``
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`vedomost`` (
  `date` DATE NOT NULL,
  `student_idstudent` INT NOT NULL,
  `employee_#emplyee` INT NOT NULL,
  `subject_subjectname` VARCHAR(85) NOT NULL,
  `mark` VARCHAR(14) NOT NULL,
  PRIMARY KEY (`date`, `student_idstudent`, `employee_#emplyee`, `subject_subjectname`),
  INDEX `fk_student_has_employee_employee1_idx` (`employee_#emplyee` ASC) VISIBLE,
  INDEX `fk_student_has_employee_student1_idx` (`student_idstudent` ASC) VISIBLE,
  INDEX `fk_student_has_employee_subject1_idx` (`subject_subjectname` ASC) VISIBLE,
  CONSTRAINT `fk_student_has_employee_student1`
    FOREIGN KEY (`student_idstudent`)
    REFERENCES `mydb`.`student` (`idstudent`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_student_has_employee_employee1`
    FOREIGN KEY (`employee_#emplyee`)
    REFERENCES `mydb`.`employee` (`#emplyee`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_student_has_employee_subject1`
    FOREIGN KEY (`subject_subjectname`)
    REFERENCES `mydb`.`subject` (`subjectname`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
