/*�ǽ� ���� #2 - �ٺ��� �л� �м�*/


/*1. �Ϻ��� �л� �м�*/
proc import datafile = 'C:\Users\samsung\Desktop\roots.csv' out = roots
dbms = csv replace;
	getnames = yes;
	guessingrows = 10;
run;

proc print data = roots (obs = 10);
run;


proc means data = roots;
	var girth4 growth girth15 weight;
	by stock;
run;


proc univariate data= roots plot;
	var girth4 growth girth15 weight;
	by stock;
run;


proc anova data = roots;
	class stock;
	model girth4 growth girth15 weight = stock;
run;


proc anova data = roots;
	class stock;
	model girth4 growth girth15 weight = stock;
	means stock;
run;


proc glm data = roots;
	class stock;
	model girth4 growth girth15 weight = stock;
run;


proc anova data = roots;
	class stock;
	model girth4 growth girth15 weight = stock;
	means stock / hovtest welch;
run;



/*�ٺ��� �л� �м�*/
proc anova data = roots;
	class stock;
	model girth4 growth girth15 weight = stock;
	manova h = stock;
run;


proc anova data = roots;
	class stock;
	model girth4 growth girth15 weight = stock;
	manova h = stock / printe;
run;


proc anova data = roots;
	class stock;
	model girth4 growth girth15 weight = stock;
	manova h = stock / printh;
run;


proc anova data = roots;
	class stock;
	model girth4 growth girth15 weight = stock;
	manova h = stock /  printh printe;
run;


proc import datafile = 'C:\Users\samsung\Desktop\rabbit.csv' out = rabbit 
dbms = csv replace;
	getnames = yes;
	guessingrows = 10;
run;

proc print data = rabbit (obs = 10);
run;

/*[���α׷� 6.1] �Ͽ���ġ �л�м� ���α׷� */
proc anova data = rabbit;
	class group;
	model x1 x2 = group;
	means group / hovtest welch;
	manova h = group / printh printe;
run;

	
proc import datafile = 'C:\Users\samsung\Desktop\cook.csv' out = cook 
dbms = csv replace;
run;
proc print data = cook;
run;

proc glm data = cook;
	class method;
	model x1 x2 x3 x4 = method;
	manova h = method / printe printh;
run;






