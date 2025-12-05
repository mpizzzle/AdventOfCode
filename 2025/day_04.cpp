#include <algorithm>
#include <cmath>
#include <fstream>
#include <iostream>
#include <numeric>
#include <ranges>
#include <string>
#include <vector>

#include "puzzles.h"

using namespace std::views;

auto stencil = [](const auto& x, int i, int j, int window = 3) {
    return transform(x | drop(i - 1) | take(window), drop(j - 1) | take(window));
};

int parse(auto f) {
    std::ifstream file;
    std::vector<std::vector<int>> grid;

    file.open("files/4.txt");

    std::ranges::transform(
        istream<std::string>(file),
        std::back_inserter(grid),
        [](std::string& buffer) { 
            std::vector<int> rolls;
            rolls.push_back(false);
            std::ranges::transform(
                buffer,
                std::back_inserter(rolls),
                [](const auto& c) { return c == '@'; });
            rolls.push_back(false);
            return rolls;
        });

    int v = grid.size() + 2, h = grid[0].size();
    std::vector<int> pad(h, 0);
    grid.insert(grid.begin(), pad);
    grid.push_back(pad);

    return f(grid, v, h);
}

int puzzle::day_04_1() {
    return parse([](auto& grid, const auto& v, const auto& h) {
        int count = 0;

        for (int i = 1; i < v - 1; ++i) {
            for (int j = 1; j < h - 1; ++j) {
                count += grid[i][j] &&
                    std::ranges::fold_left(stencil(grid, i, j) | join, 0, std::plus<>{})
                    < 5;
            }
        }

        return count;
    });
}

int puzzle::day_04_2() {
    return parse([](auto& grid, const auto& v, const auto& h) {
        bool reduced = true;
        int count = 0;

        while (reduced) {
            reduced = false;
            for (int i = 1; i < v - 1; ++i) {
                for (int j = 1; j < h - 1; ++j) {
                    if (grid[i][j] &&
                        std::ranges::fold_left(stencil(grid, i, j) | join, 0, std::plus<>{})
                        < 5) {
                        reduced = true;
                        grid[i][j] = false;
                        ++count;
                    }
                }
            }
        }

        return count;
    });
}

