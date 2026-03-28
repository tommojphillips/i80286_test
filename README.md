# 80286_test

A test program that tests my i80286 CPU Core using the hardware generated tests from SingleStepTests/ProcessorTests/80286.

## Building

The project is built in Visual Studio 2022 / 2026

 | Dependencies   |                                          |
 | -------------- | ---------------------------------------- |
 | I80286         | https://github.com/tommojphillips/i80286 |
 | cJSON          | https://github.com/DaveGamble/cJSON      |

---

 1. Clone the repo and submodules
  
  ```
  git clone --recurse-submodules https://github.com/tommojphillips/i80286_test.git
  ```

 2. Open `i80286_test\vc\80286_test.sln`, build.

 3. Clone 80286 JSON tests from SingleStepTests/ProccessorTests
  
  ```
  git clone https://github.com/SingleStepTests/ProcessorTests.git
  ```

 4. Extract all `.json` tests from `ProcessorTests\80286\v1\` to `i80286_tests\tests`

 5. Open a terminal in the root directory of the repo.

 5. Run the command below.
 
 Syntax:
 ```
 run_tests.bat <exe> <json_test_dir> <starting_test>
 ```

 ```
 run_tests.bat bin\x64\Debug\i80286_tests.exe tests\ 00.json
 ```

The .bat will run all tests in that directory.