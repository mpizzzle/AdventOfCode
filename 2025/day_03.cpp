#include <algorithm>
#include <cmath>
#include <fstream>
#include <vector>

#include "puzzles.h"

long parse(long bank_length) {
    std::ifstream file;
    std::string buffer;
    auto atol = [](char c) { return std::atol(&c); };
    long count = 0;

    file.open("files/3.txt");

    while (std::getline(file, buffer)) {
        std::vector<long> batteries;
        std::transform(buffer.begin(), buffer.end(), std::back_inserter(batteries), atol);
        std::vector<long> bank(batteries.begin(), batteries.begin() + bank_length);

        for (unsigned long i = bank_length; i < buffer.size(); ++i) {
            for (long j = 0; j < bank_length - 1; ++j) {
                if (bank[j] < bank[j + 1]) {
                    bank.erase(bank.begin() + j);
                    bank.push_back(batteries[i]);
                    break;
                }
            }

            bank.back() = std::max(bank.back(), batteries[i]);
        }

        for (unsigned long i = 0; i < bank.size(); ++i) {
             count += bank[bank_length - i - 1] * std::pow(10, i);
        }
    }

    return count;
}

long puzzle::day_03_1() {
    return parse(2);
}

long puzzle::day_03_2() {
    return parse(12);
}

