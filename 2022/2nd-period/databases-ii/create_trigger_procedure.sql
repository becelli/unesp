DROP TABLE IF EXISTS workers;
DROP TABLE IF EXISTS dependents;
DROP PROCEDURE IF EXISTS increase_salary; 

CREATE TABLE IF NOT EXISTS workers (
    worker_id SERIAL,
    name VARCHAR(100) NOT NULL UNIQUE,
    salary REAL NOT NULL,
    join_date DATE NOT NULL,
    cpf VARCHAR(11) NOT NULL UNIQUE,
    rg VARCHAR(9) NOT NULL UNIQUE,

    PRIMARY KEY (worker_id)
)

CREATE TABLE IF NOT EXISTS dependents (
    worker_id INT NOT NULL,
    name VARCHAR(100) NOT NULL,
    kinship VARCHAR(100) NOT NULL,
    birth_date DATE NOT NULL,
    
    PRIMARY KEY (worker_id, name)
)


-- CREATE PROCEDURE TO INCREASE WORKER SALARY FOR 10% FOR EACH DEPENDENT
CREATE PROCEDURE increase_salary()
BEGIN
    DECLARE N INT DEFAULT 0;
    DECLARE worker_id INT;
    DECLARE salary REAL;
    DECLARE salary_increase REAL;

    DECLARE done INT DEFAULT FALSE;
    DECLARE cur1 CURSOR FOR SELECT worker_id, salary FROM workers;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

    OPEN cur1;
    read_loop: LOOP
        FETCH cur1 INTO worker_id, salary;
        IF done THEN
            LEAVE read_loop;
        END IF;
        SELECT COUNT(*) INTO N FROM dependents WHERE worker_id = worker_id;
        SET salary_increase = salary * 0.1 * N;
        UPDATE workers SET salary = salary + salary_increase WHERE worker_id = worker_id;
    END LOOP;

    CLOSE cur1;
END




INSERT INTO workers (name, salary, join_date, cpf, rg) VALUES ("Gustavo", 1000, '2002-01-26', '47049866830', '576163867'); 
INSERT INTO dependents VALUES (1, "Tereza", "filha", "2020-01-02");

SELECT * FROM workers;
#UPDATE workers SET salary = 1000 WHERE 1;
SELECT * FROM dependents;
SELECT * from information_schema.ROUTINES;

call increase_salary();

