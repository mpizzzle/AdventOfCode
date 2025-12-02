#include <cmath>
#include <fstream>

#include "puzzles.h"

long parse(auto f) {
    std::ifstream file;
    std::string buffer;
    file.open("files/2.txt");
    long count = 0;

    while (std::getline(file, buffer, ',')) {
        auto mid = buffer.find('-');
        auto stol = [buffer](int a, int b) { return std::stol(buffer.substr(a, b)); };
        auto first = stol(0, mid), second = stol(mid + 1, buffer.length());

        for (long id = first; id <= second; ++id) {
            count += f(id, std::floor(1 + std::log10(id)));
        }
    }

    return count;
}

long puzzle::day_02_1() {
    return parse([&](long id, long digits) {
        long mask = std::pow(10, digits / 2);
        return digits & 1 || id / mask != id % mask ? 0L : id;
    });
}

long puzzle::day_02_2() {
    return parse([&](long id, long digits) {
        for (long j = 1; j <= digits / 2; ++j) {
            if (digits % j != 0) {
                continue;
            }

            long mask = std::pow(10, j);
            long id_copy = id;
            bool valid = false;

            for (long k = 0; k < digits / j - 1; ++k) {
                valid |= id_copy / mask % mask != id_copy % mask;
                id_copy /= mask;
            }

            if (!valid) {
                return id;
            }
        }

        return 0L;
    });
}
