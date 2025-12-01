#include <fstream>
#include <iostream>
#include <string>

#include "puzzles.h"

int parse(auto f) {
    std::ifstream input_file;
    input_file.open("files/1.txt");
    std::string buffer;
    int count = 0, pos = 50;

    while (std::getline(input_file, buffer)) {
        int mag = std::atoi(buffer.substr(1, buffer.size()).c_str());
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

