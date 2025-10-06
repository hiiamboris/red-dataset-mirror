Red[]

#include %cred.red

do-test: func [index /local test][
	test: pick tests index
	either 'only = test/3 [
		test/2 = cred/only test/1
	][
		test/2 = cred test/1
	]
]

tests: [

	[[a: 1] {int a = 1;^/} only]

	[[a: 1 b: a + 1] {int a = 1;^/ int b = a + 1;^/} only]

	[
		[
			#define LED 2
			setup: func [][
				pinMode LED OUTPUT
			]
			loop: func [][
				delay 500
				digitalWrite LED HIGH
				delay 500
				digitalWrite LED LOW
			]
		]
{#define LED 2

void setup() {
	// Set pin mode
	pinMode(LED,OUTPUT);
}

void loop() {
	delay(500);
	digitalWrite(LED,HIGH);
	delay(500);
	digitalWrite(LED,LOW);
}
}]

	[
		[
			max: func [
				num1 [integer!] num2 [integer!] 
				return: [integer!] 
				/local result [integer!]
			][
				either num1 > num2 [
					result: num1
				][
					result: num2
				]
				return result
			]
		]
{/* function returning the max between two numbers */
int max(int num1, int num2) {

	/* local variable declaration */
	int result;

	if (num1 > num2)
	result = num1;
	else
	result = num2;

	return result; 
}}
	]
]
