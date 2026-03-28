# 8086_test

A test program that tests my i8086 CPU Core using the hardware generated tests from SingleStepTests/ProcessorTests/8088. Currently passes all tests but DIV and IDIV. DIV and IDIV dont define any flags so the tests are failing because of the undefined state of the flags after a DIV/IDIV. Results are correct.

## Building

The project is built in Visual Studio 2022

 | Dependencies   |                                        |
 | -------------- | -------------------------------------- |
 | I8086         | https://github.com/tommojphillips/i8086 |
 | cJSON         | https://github.com/DaveGamble/cJSON     |

---

 1. Clone the repo and submodules
  
  ```
  git clone --recurse-submodules https://github.com/tommojphillips/i8086_test.git
  ```

 2. Open `i8086_test\vc\8086_test.sln`, build.

 3. Clone 8088 JSON tests from SingleStepTests/ProccessorTests
  
  ```
  git clone https://github.com/SingleStepTests/ProcessorTests.git
  ```

 4. Extract all `.json` tests from `ProcessorTests\8088\v1\` to `i8086_tests\tests`

 5. Open a terminal in the root directory of the repo.

 5. Run the command below.
 
 Syntax:
 ```
 run_tests.bat <exe> <json_test_dir> <starting_test>
 ```

 ```
 run_tests.bat bin\x64\Debug\i8086_tests.exe tests\ 00.json
 ```

The .bat will run all tests in that directory.