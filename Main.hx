/*
 * Apache License, Version 2.0
 *
 * Copyright (c) 2022 CheemsAndFriends
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at:
 *     http://www.apache.org/licenses/LICENSE-2.0
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

@:noCompletion
@:forward
abstract FromTwo<T1, T2, T3>(Dynamic) from T1 from T2 from T3 to T1 to T2 to T3 {}
@:noCompletion
typedef Number = FromTwo<Int, Float, String>;
/**
 * The whole Main shit
 */
class Main
{
    public static function main()
    {
        trace("Checking if it actually works lol");
        trace("isEven 2?");
        #if !sys
        trace(NumberChecker.isEven(2));
        trace("should be true!");
        #else
        trace("Oh fuck! You're checking this in interp shit!!!");
        trace("What number do you want to check dude?");
        var input = Sys.stdin().readLine();
        trace(NumberChecker.isEven(input));
        Sys.sleep(0.5);
        trace("Was that correct?");
        Sys.sleep(1);
        trace("Well, how about we do isOdd?");
        Sys.sleep(0.1);
        trace("add your odd number!");
        var input = Sys.stdin().readLine();
        trace(NumberChecker.isOdd(input));
        trace("was that correct?");
        Sys.sleep(0.5);
        trace("Well, anyway, bye!");
        #end
    }
}
class NumberChecker
{
    /**
    * This checks out if this is an even number
    * @param number The number you're checking. it can be an `Int`, `Float` or `String`
    * @return if the number is even or not.
    */
    public static function isEven(number:Number):Bool
    {
        if (!(number is String))
        {
            var array = Std.string(number).split("");
            var lastnum = Std.parseInt(array[array.length - 1]);
            return lastnum % 2 == 0;
        }
        else
        {
            number = number.toLowerCase();
            if (["odd", "even"].indexOf(number) != -1)
                return number == "even";
            if (!Math.isNaN(Std.parseFloat(number)))
            {
                var array = number.split("");
                var lastnum = Std.parseInt(array[array.length - 1]);
                return lastnum % 2 == 0;
            }
            var parsedNumber = parseStringifiedNumbers(number);
            return parsedNumber % 2 == 0;
        }
    }
    public static function isOdd(number:Number):Bool
    {
        return !isEven(number);
    }
    private static function parseStringifiedNumbers(num:String):Float
    {
        num = StringTools.trim(num).toLowerCase();
        var numbers = StringTools.replace(num, "-", " ").split(" ");
        var parsednumber:Float = 0;
        var checks:Int = 0;
        var comma:Bool = false;
        for (number in numbers)
        {
            switch (number)
            {
                case "zero":
                    parsednumber += 0;
                case "a", "one":
                    parsednumber++;
                case "two":
                    parsednumber += (!comma) ? 2 : 0.2;
                case "three":
                    parsednumber += (!comma) ? 3 : 0.3;
                case "four":
                    parsednumber += (!comma) ? 4 : 0.4;
                case "five":
                    parsednumber += (!comma) ? 5 : 0.5;
                case "six":
                    parsednumber += (!comma) ? 6 : 0.6;
                case "seven":
                    parsednumber += (!comma) ? 7 : 0.7;
                case "eight":
                    parsednumber += (!comma) ? 8 : 0.8;
                case "nine":
                    parsednumber += (!comma) ? 9 : 0.9;
                case "ten":
                    parsednumber += (!comma) ? 10 : 0.10;
                case "eleven":
                    parsednumber += (!comma) ? 11 : 0.11;
                case "twelve":
                    parsednumber += (!comma) ? 12 : 0.12;
                case "thirteen":
                    parsednumber += (!comma) ? 13 : 0.13;
                case "fourteen":
                    parsednumber += (!comma) ? 14 : 0.14;
                case "fifteen":
                    parsednumber += (!comma) ? 15 : 0.15;
                case "sixteen":
                    parsednumber += (!comma) ? 16 : 0.16;
                case "seventeen":
                    parsednumber += (!comma) ? 17 : 0.17;
                case "eighteen":
                    parsednumber += (!comma) ? 18 : 0.18;
                case "nineteen":
                    parsednumber += (!comma) ? 19 : 0.19;
                case "twenty":
                    parsednumber += (!comma) ? 20 : 0.20;
                case "thirty":
                    parsednumber += (!comma) ? 30 : 0.30;
                case "forty", "fourty":
                    parsednumber += (!comma) ? 40 : 0.40;
                case "fifty":
                    parsednumber += (!comma) ? 50 : 0.50;
                case "sixty":
                    parsednumber += (!comma) ? 60 : 0.60;
                case "seventy":
                    parsednumber += (!comma) ? 70 : 0.70;
                case "eighty":
                    parsednumber += (!comma) ? 80 : 0.80;
                case "ninety":
                    parsednumber += (!comma) ? 90 : 0.90;
                case "hundred":
                    parsednumber *= (!comma) ? 100 : 0.100;
                case "thousand":
                    parsednumber *= (!comma) ? 1000 : 0.1000;
                case "million":
                    parsednumber *= (!comma) ? 1000000 : 0.1000000;
                case "billion":
                    parsednumber *= (!comma) ? 1000000000 : 0.1000000000;
                case "trillion":
                    parsednumber *= (!comma) ? 1000000000 : 0.1000000000;
                case "minus":
                    parsednumber -= parseStringifiedNumbers(numbers[checks + 1]);
                    numbers.splice(checks + 1, checks + 1);
                case "plus":
                    parsednumber += parseStringifiedNumbers(numbers[checks + 1]);
                    numbers.splice(checks + 1, checks + 1);
                case "multiplied":
                    trace(numbers[checks + 1]);
                    if (numbers[checks + 1] == "by")
                        trace("haha, by");
                    numbers.remove("by");
                    parsednumber *= parseStringifiedNumbers(numbers[checks + 1]);
                    numbers.splice(checks + 1, checks + 1);
                case "divided":
                    if (numbers[checks + 1] == "by")
                    {
                        numbers.splice(checks + 1, checks + 1);
                    }
                    parsednumber /= parseStringifiedNumbers(numbers[checks + 1]);
                    numbers.splice(checks + 1, checks + 1);
                case "", "and":
                    continue;
                case "comma":
                    comma = true;
                default:
                    trace('What the actual fuck is $number???\n...\nDumass');
            }
            checks++;
        }
        trace(parsednumber);
        return parsednumber;
    }
}
