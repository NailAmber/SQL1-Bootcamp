CREATE OR REPLACE FUNCTION fnc_fibonacci(pstop INTEGER DEFAULT 10)
RETURNS TABLE (fib_number INTEGER) AS
$$
DECLARE
    a INTEGER := 0;
    b INTEGER := 1;
    temp INTEGER;
BEGIN
    RETURN QUERY SELECT a;
    
    WHILE b < pstop LOOP
        RETURN QUERY SELECT b;
        temp := a + b;
        a := b;
        b := temp;
    END LOOP;
END;
$$
LANGUAGE plpgsql;


select * from fnc_fibonacci(100);

select * from fnc_fibonacci();
