#include <fstream>
#include <ranges>

#include "puzzles.h"

int parse(auto f) {
    std::ifstream file;
    file.open("files/1.txt");
    int count = 0, pos = 50;

    for (auto& buffer : std::views::istream<std::string>(file)) {
        int mag = std::stoi(buffer.substr(1));
        int offset = (mag % 100) * (buffer.front() == 'L' ? -1 : 1);
        int newpos = (pos + 100 + offset) % 100;
        count += f(newpos, pos, mag, offset);
        pos = newpos;
    }

    return count;
}

int puzzle::day_01_1() {
    return parse([](int newpos...) {
        return newpos == 0;
    });
}

int puzzle::day_01_2() {
    return parse([](int newpos, int pos, int mag, int offset) {
        return (mag / 100) + (newpos == 0 || (pos != 0 && (pos + offset) != newpos));
    });
}

