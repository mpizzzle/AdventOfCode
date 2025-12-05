#include <algorithm>
#include <cmath>
#include <climits>
#include <fstream>
#include <iostream>
#include <vector>
#include <ranges>

#include "puzzles.h"

long parse(auto f) {
    std::ifstream file;
    std::string buffer;
    std::vector<std::vector<long>> ranges;
    std::vector<long> vals;
    file.open("files/5.txt");
    bool next = true;

    while (std::getline(file, buffer)) {
        if (buffer.empty()) {
            next = false;
            continue;
        }
        if (next) {
            auto mid = buffer.find('-');
            auto stol = [buffer](long l, long r) { return std::stol(buffer.substr(l, r)); };
            ranges.push_back({stol(0, mid), stol(mid + 1, buffer.length())});
        }
        else {
            vals.push_back(std::stol(buffer));
        }
    }

    return f(ranges, vals);
}

long puzzle::day_05_1() {
    return parse([](auto& ranges, const auto& vals) {
        long count = 0L;
        for (long val : vals) {
            for (auto range : ranges) {
                if (val >= range[0] && val <= range[1]) {
                    ++count;
                    break;
                }
            }
        }
        return count;
    });
}

long puzzle::day_05_2() {
    return parse([](auto& ranges...) {
        std::ranges::sort(ranges,
            [](const auto& a, const auto& b) { return a.front() <= b.front(); });

        for (unsigned long i = 0; i < ranges.size() - 1L; ++i) {
            if (ranges[i][1] >= ranges[i + 1][0]) {
                ranges[i][1] = std::max(ranges[i][1], ranges[i + 1][1]);
                ranges.erase(ranges.begin() + i-- + 1);
            }
        }

        return std::ranges::fold_left(ranges |
            std::views::transform(
                [](const auto& range){ return 1 + (range[1] - range[0]); }),
            0, std::plus<>{});
    });
}
