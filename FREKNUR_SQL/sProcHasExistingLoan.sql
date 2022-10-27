
DELIMITER $$

CREATE DEFINER=`root`@`localhost` PROCEDURE db_freknur_loan.`sProcHasExistingLoan`(
	IN `MSISDN` VARCHAR(50),
	OUT `OUTPUT` VARCHAR(1)
)
LANGUAGE SQL
NOT DETERMINISTIC
CONTAINS SQL
SQL SECURITY DEFINER
COMMENT ''
BEGIN
	-- ====================================================================
	-- .Params.
	-- .@MSISDN
	-- .@OUTPUT.
	-- ====================================================================
	IF(TRIM(MSISDN) <> "") THEN
		-- ====================================================================
		-- .sql statement 1.
		-- ====================================================================	
		SET @STMT_1 = CONCAT("SELECT ",
		                     "COUNT(`reference_no`) ",
				     "INTO ",
				     "@LOAN_CNT ",
				     "FROM ",
				     "`tbl_debtor` ",
				     "WHERE ",
				     "`msisdn` = '",TRIM(MSISDN),"' AND `is_repaid` = '0'");
		PREPARE QUERY FROM @STMT_1;
		EXECUTE QUERY;
		DEALLOCATE PREPARE QUERY;
		-- ====================================================================
		-- .get loan count.
		-- ====================================================================
		IF(@LOAN_CNT = "0")THEN
			SET @NO_OF_LOAN = 0;
		ELSE
			SET @NO_OF_LOAN = 1;
		END IF;
		-- ====================================================================
		-- .output.
		-- ====================================================================
		SET OUTPUT = @NO_OF_LOAN; 	
	END IF;
	-- ====================================================================
	-- .reset the vars.
	-- ====================================================================
	SET @STMT_1     = NULL;
	SET @LOAN_CNT   = NULL;
	SET @NO_OF_LOAN = NULL;
	SET MSISDN      = NULL;
END$$
DELIMITER; //
