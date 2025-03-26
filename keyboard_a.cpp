#include <iostream>
#include <termios.h>
#include <unistd.h>
#include <fcntl.h>
#include <unordered_set>

class Keyboard {
public:
    Keyboard() {
        // 터미널 설정을 저장합니다.
        tcgetattr(STDIN_FILENO, &initial_settings);

        // 새로운 설정을 만듭니다.
        new_settings = initial_settings;
        new_settings.c_lflag &= ~(ICANON | ECHO); // Canonical 모드 및 echo를 끕니다.
        new_settings.c_cc[VMIN] = 0;  // 최소 읽기 문자를 0으로 설정합니다.
        new_settings.c_cc[VTIME] = 0; // 타임아웃 시간을 0으로 설정합니다.

        // 새 설정을 적용합니다.
        tcsetattr(STDIN_FILENO, TCSANOW, &new_settings);

        // stdin을 논블로킹 모드로 설정합니다.
        fcntl(STDIN_FILENO, F_SETFL, O_NONBLOCK);
    }

    ~Keyboard() {
        // 종료시 원래 설정으로 복구합니다.
        tcsetattr(STDIN_FILENO, TCSANOW, &initial_settings);
    }

    // 키가 눌렸는지 확인하는 함수
    bool keyPressed() {
        char ch;
        while (read(STDIN_FILENO, &ch, 1) == 1) {
            pressed_keys.insert(ch);
			return true;
        }

        return false;
    }

    // 키가 때졌는지 확인하는 함수
    bool keyReleased() {
        std::unordered_set<char> current_pressed_keys;
        char ch;

        // 현재 눌린 키들을 읽어옵니다.
        while (read(STDIN_FILENO, &ch, 1) == 1) {
            current_pressed_keys.insert(ch);
        }

        // 이전에 눌렸던 키 중에 현재 눌려있지 않은 키가 있는지 확인합니다.
        for (const char& key : pressed_keys) {
            if (current_pressed_keys.find(key) == current_pressed_keys.end()) {
                last_released_key = key;
				pressed_keys.erase(key);
                return true;
            }
        }

        pressed_keys = std::move(current_pressed_keys);
        return false;
    }

    // 마지막으로 때진 키를 반환하는 함수
    char getLastReleasedKey() {
        return last_released_key;
    }

private:
    struct termios initial_settings, new_settings;
    std::unordered_set<char> pressed_keys;
    char last_released_key;
};

int main() {
    Keyboard keyboard;

    std::cout << "Press any key to see its value. Press 'q' to quit." << std::endl;

    while (true) {
        if (keyboard.keyPressed()) {
            // 키가 눌렸을 때 처리
			std::cout << "Hello, World\n";
        }

        if (keyboard.keyReleased()) {
            char key = keyboard.getLastReleasedKey();
            std::cout << "Key released: " << key << std::endl;
            if (key == 'q') {
                break;
            }
        }
    }

    return 0;
}

