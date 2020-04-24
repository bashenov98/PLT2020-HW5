Euro = { amount: Float };
Dollar = { amount: Float };
Rub = { amount: Float };
Tenge = { amount: Float };

separate = lambda x:Unit. "=================================================";

Currency = < euro: Euro, dollar: Dollar, rub: Rub, tenge: Tenge>;

looseMoney = lambda a:Currency.
	case a of
		<euro=x> ==> timesfloat x.amount 464.93 
		| <dollar=x> ==> timesfloat x.amount 426.46
		| <rub=x> ==> timesfloat x.amount 5.72
		| <tenge=x> ==> x.amount;

money1 = { amount = 5.3 } as Euro;
money2 = { amount = 4.3 } as Dollar;
money3 = { amount = 3.3 } as Rub;
money4 = { amount = 111.2 } as Tenge;

euro1 = <euro=money1> as Currency;
dollar1 = <dollar=money2> as Currency;
rub1 = <rub=money3> as Currency;
tenge1 = <tenge=money4> as Currency;

separate unit;

looseMoney euro1;
looseMoney dollar1;
looseMoney rub1;
looseMoney tenge1;

separate unit;

Money = <euro:Unit, dollar:Unit, rub:Unit, tenge:Unit>;

convert = lambda amount:Currency. lambda targetCurrency:Money.
	case targetCurrency of
		<euro=x> ==> timesfloat (looseMoney amount) 0.00215086142
		| <dollar=x> ==> timesfloat (looseMoney amount) 0.0023448858
		| <rub=x> ==> timesfloat (looseMoney amount) 0.17482517482
		| <tenge=x> ==> looseMoney amount;

euro = <euro=unit> as Money;
dollar = <dollar=unit> as Money;
rub = <rub=unit> as Money;
tenge = <tenge=unit> as Money;

separate unit;

convert euro1 euro;
convert dollar1 euro; 
convert rub1 euro; 
convert tenge1 euro; 

separate unit;

convert euro1 dollar; 
convert dollar1 dollar; 
convert rub1 dollar; 
convert tenge1 dollar; 

separate unit;

convert euro1 rub;
convert dollar1 rub;
convert rub1 rub;
convert tenge1 rub;

separate unit;

convert euro1 tenge;
convert dollar1 tenge;
convert rub1 tenge;
convert tenge1 tenge;

separate unit;