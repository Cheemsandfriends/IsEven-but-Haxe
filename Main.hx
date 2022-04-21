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
        trace(NumberChecker.isEven(2));
        trace("should be true!");
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
        }

        return false;
    }
    public static function isOdd(number:Number):Bool
    {
        return !isEven(number);
    }
    private static function parseStringifiedNumbers(num:String):Number
    {
        num = StringTools.trim(num).toLowerCase();
        return 0;
    }
}
