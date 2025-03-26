#include <iostream>
#include <future>
#include <functional>
#include <queue>
#include <mutex>
#include <thread>
#include <chrono>
#include <condition_variable>

void product(
	std::mutex& m, 
	std::condition_variable& cv,
	std::queue<int>& q,
	int k
){
	std::cout << "product start\n";
	for(int i = 0+k; i < 10+k; i ++){
		{
			std::lock_guard<std::mutex> guard(m);
			q.push(i);
		}
		cv.notify_one();
		std::this_thread::sleep_for(
			std::chrono::seconds((i + k)%7)
		);
	}
	std::cout << "product end\n";
}


void set_future(std::promise<int>& p, int x){
	p.set_value(x);
}

int main(){
	std::mutex m;
	std::condition_variable cv;
	std::queue<int> q;
	std::thread th(
		product, std::ref(m), std::ref(cv), std::ref(q), 0
	);
	std::thread th2(
		product, std::ref(m), std::ref(cv), std::ref(q), 10
	);
	std::cout << "entry loop\n";	
	for(int i = 0; i < 20; i ++){
		{
			std::unique_lock<std::mutex> lk(m);
			std::cout << m.try_lock();
			m.unlock();
			cv.wait(
				lk, [&](){ return !q.empty(); }
			);

			std::cout << m.try_lock();
			m.unlock();
			std::cout << q.front() << std::endl;
			q.pop();
		}
	}
	std::cout << "outro loop\n";
	
	th.join();
	th2.join();

	return 0;
}

