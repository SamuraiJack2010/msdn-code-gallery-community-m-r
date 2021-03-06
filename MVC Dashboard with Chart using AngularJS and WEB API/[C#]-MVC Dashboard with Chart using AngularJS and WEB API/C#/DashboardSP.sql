USE [DashboardDB]
GO
/****** Object:  StoredProcedure [dbo].[USP_Dashboard_Select]    Script Date: 2016-04-19 오후 6:07:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- 1) select top 10 random kidsLearnerMaster records     

-- Author      : Shanu                                                                
-- Create date :  2016-02-28                                                                
-- Description :select top 10 random kidsLearnerMaster records                                            
-- Tables used :  kidsLearnerMaster                                                            
-- Modifier    : Shanu                                                                
-- Modify date : 2016-02-28                                                                
-- =============================================  
-- To Select all user roles 
-- EXEC USP_Dashboard_Select @columnName = 'UserName,UserType,Phone' ,@TableNames = 'UserDetails' ,@isCondition=0,@ConditionList='UserType=''ADMIN'' ',@isGroupBY =1,@GroupBYList = 'UserName,UserType,Phone', @isOrderBY =1,@OrderBYList = ' UserType '

-- EXEC USP_Dashboard_Select @columnName = 'ItemName,SUM(Price) as totalCost' ,@TableNames = 'ItemDetail' ,@isCondition=0,@ConditionList='Price>''400'' ',@isGroupBY =1,@GroupBYList = 'ItemName'
-- EXEC USP_Dashboard_Select @sqlQuery = 'Select * from ItemDetail'
-- EXEC USP_Dashboard_Select @sqlQuery = 'select ID,ItemNo ,ItemName ,Comments ,Price from ItemDetail'

-- =============================================  
ALTER PROCEDURE [dbo].[USP_Dashboard_Select]   
(  
     @sqlQuery varchar(MAX)='',
	 @columnName varchar(MAX)='',
	 @TableNames varchar(MAX)='',
	 @isCondition INT=0,
	 @ConditionList varchar(MAX)='',	
	 @isGroupBY INT=0,
	 @GroupBYList varchar(MAX)='',
	 @isOrderBY INT=0,
	 @OrderBYList varchar(MAX)=''	
  )       
AS                                                                
BEGIN   


IF @sqlQuery ='' 
	BEGIN
		   SET @sqlQuery = 'SELECT ' + @columnName + ' FROM ' + @TableNames 

				IF @isCondition=1
				BEGIN
				SET @sqlQuery = @sqlQuery+ ' WHERE ' + @ConditionList 
				END

				IF @isGroupBY=1
				BEGIN
				SET @sqlQuery = @sqlQuery+ ' GROUP BY ' + @GroupBYList 
				END


				IF @isOrderBY=1
				BEGIN
				SET @sqlQuery = @sqlQuery+ ' Order BY ' + @OrderBYList 
				END

			EXEC (@sqlQuery)
		
		 
	END
ELSE
		BEGIN
		EXEC (@sqlQuery)
		
		
		END
			--  select * from UserDetails
END

