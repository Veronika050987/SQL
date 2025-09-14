-- fnGetOrthodoxEasterDate

CREATE FUNCTION dbo.fnGetOrthodoxEasterDate (@Year INT)
RETURNS DATE
AS
BEGIN
    -- Алгоритм расчета православной Пасхи (Григорианский календарь)
    --DECLARE @A INT = @Year % 19;
    --DECLARE @B INT = FLOOR(@Year / 100);
    --DECLARE @C INT = @Year % 100;
    --DECLARE @D INT = FLOOR(@B / 4);
    --DECLARE @E INT = @B % 4;
    --DECLARE @F INT = FLOOR((@B + 8) / 25);
    --DECLARE @G INT = FLOOR((@A * 11 + @F - @D - @E + 20) / 33);
    --DECLARE @H INT = (@A * 11 + @F - @D - @E + 20 - 33 * @G) % 30;
    --DECLARE @I INT = FLOOR((@C + @H - @E * (CASE WHEN @E < 4 THEN 1 ELSE 0 END) + 10000) / 30);
    --DECLARE @J INT = (@C + @H - @E * (CASE WHEN @E < 4 THEN 1 ELSE 0 END) + 10000 - 30 * @I) % 30;
    --DECLARE @K INT = FLOOR((3 * (@B + 1 + @D - @E - @F + 12) + @J) / 365);
    --DECLARE @L INT = 3 * (@B + 1 + @D - @E - @F + 12 + 12 * @K) % 365;
    --DECLARE @Month INT = FLOOR((@L + 22) / 32);
    --DECLARE @Day INT = @L + 22 - 31 * @Month;
    DECLARE @Year INT = 2027;
    DECLARE @A INT = @Year % 19;
    DECLARE @B INT = @Year % 4;
    DECLARE @C INT = @Year % 7;
    DECLARE @K INT = @Year / 100;
    DECLARE @P INT =  ((13 + 8* @K)/25);
    DECLARE @Q INT =  (@K/4);
    DECLARE @M INT = ((15 - @P + @K - @Q) % 30);
    DECLARE @N INT = ((4 + @K - @Q) % 7);
    DECLARE @D INT = ((19 * @A + @M) % 30);
    DECLARE @E INT = (2 * @B + 4 * @C + 6 * @D + @N) % 7;

    PRINT @A;
    PRINT @B;
    PRINT @C;
    PRINT @K;
    PRINT @P;
    PRINT @Q;
    PRINT @M;
    PRINT @N;
    PRINT @D;
    PRINT @E;

    --DECLARE @F INT = FLOOR((@B + 8) / 25);
    --DECLARE @G INT = FLOOR((@A * 11 + @F - @D - @E + 20) / 33);
    --DECLARE @H INT = (@A * 11 + @F - @D - @E + 20 - 33 * @G) % 30;
    --DECLARE @I INT = FLOOR((@C + @H - @E * (CASE WHEN @E < 4 THEN 1 ELSE 0 END) + 10000) / 30);
    --DECLARE @J INT = (@C + @H - @E * (CASE WHEN @E < 4 THEN 1 ELSE 0 END) + 10000 - 30 * @I) % 30;
    --DECLARE @K INT = FLOOR((3 * (@B + 1 + @D - @E - @F + 12) + @J) / 365);
    --DECLARE @L INT = 3 * (@B + 1 + @D - @E - @F + 12 + 12 * @K) % 365;
    --DECLARE @Month INT = FLOOR((@L + 22) / 32);
    --DECLARE @Day INT = @L + 22 - 31 * @Month;

    --RETURN CAST(CAST(@Year AS VARCHAR(4)) + '-' + CAST(@Month AS VARCHAR(2)) + '-' + CAST(@Day AS VARCHAR(2)) AS DATE);
END;
GO

--print (2026 / 100)