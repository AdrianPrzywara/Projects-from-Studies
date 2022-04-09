// JPO_Projekt.cpp : Ten plik zawiera funkcję „main”. W nim rozpoczyna się i kończy wykonywanie programu.
//

#include <iostream>
#include <string>
#include <fstream>
#include <vector>
#include <ctime>
#include <stdio.h>

using namespace std;

class admin { //Klasa zawierająca informacje oraz metody związane z adminem
private:
    string a_login;
    string a_password;
public:
    admin(string login, string password) :a_login(login), a_password(password) {}
    void loginAdmin();	//Panel logowania admina
    void view();	//Widok menu admina
    int addStudent();	//Dodawanie nowego studenta
    int changePassword();	//Zmiana hasła admina
    int changeStudentPassword();	//Zmiana hasła studenta
    void showStudentList();		//Wyświetlenie listy wszystkich studentów
    void showStudentAttendance();	//wyświetlenie historii obecności wybranego studenta
    void showAllAttendance();		//wyświetlenie historii obecności wszystkich studentów
    int changeStudentAttendance();	//Zmiana obecności studenta
	//Poniżej gettery oraz settery do składowych prywatnych klasy
    string getLogin() const {
        return a_login;
    }
    string getPassword() const {
        return a_password;
    }
    void setLogin(string login) {
        a_login = login;
    }
    void setPassword(string password) {
        a_password = password;
    }
};

class student { //Klasa zawierająca informacje oraz metody związane z studentem
private:
    string s_login;
    string s_password;
    string s_imie;
    string s_nazwisko;
    bool today_attendance = false;
    string s_history = "";
    int s_attendance_count = 0;
public:
    student(string imie, string nazwisko, string login, string password) :s_login(login), s_password(password), s_imie(imie), s_nazwisko(nazwisko) {}
    void view();	//Widok menu studenta
    int changePassword();	//Zmiana hasła
    void markAttendance();	//Zaznaczenie obecności
    void viewHistory();		//Wyświetlenie historii obecności
	//Poniżej gettery oraz settery do składowych prywatnych klasy
    string getLogin() const {
        return s_login;
    }
    string getPassword() const {
        return s_password;
    }
    string getImie() const {
        return s_imie;
    }
    string getNazwisko() const {
        return s_nazwisko;
    }
    int getAttendanceCount() const {
        return s_attendance_count;
    }
    string getHistory() const {
        return s_history;
    }
    bool getAttendance() const {
        return today_attendance;
    }
    void setLogin(string login) {
        s_login = login;
    }
    void setPassword(string password) {
        s_password = password;
    }
    void setImie(string imie) {
        s_imie = imie;
    }
    void setNazwisko(string nazwisko) {
        s_nazwisko = nazwisko;
    }
    void setHistory(string history) {
        s_history = history;
    }
    void setAttendanceCount(int attendance) {
        s_attendance_count = attendance;
    }
    void setAttendance(bool attendance) {
        today_attendance = attendance;
    }
};

vector<class student> baza; //vector przechowujący zarejestrowanych studentów

int find(string login) { //funkcja wyszukująca studenta w wektorze po nicku
    for (unsigned int i = 0; i < baza.size(); i++) {
        if (baza[i].getLogin() == login) {
            return i;
        }
    }
    return -1;
}

void getStudentList() {	//funkcja odczytująca dane studentów potrzebne do stworzenia obiektu klasy student z pliku
    fstream students_file("students.txt", ios::in);
    string str, login, haslo, imie, nazwisko;
    if (students_file.is_open()) {
        while (getline(students_file, str)) {
            size_t i;
            login = str.substr(0, str.find(" "));
            i = str.find(" ");
            haslo = str.substr(i + 1, str.find(" ", i + 1) - i - 1);
            i = str.find(" ", i + 1);
            imie = str.substr(i + 1, str.find(" ", i + 1) - i - 1);
            i = str.find(" ", i + 1);
            nazwisko = str.substr(i + 1);

            student s(imie, nazwisko, login, haslo);
            baza.push_back(s);
        }
        students_file.close();
    }
}

void setStudentList() {	//funkcja zapisująca aktualny stan vectora do pliku
    fstream students_file("students.txt", ios::out | ios::trunc);
    if (students_file.is_open()) {
        for (auto element : baza) {
            students_file << element.getLogin() << " " << element.getPassword() << " " << element.getImie() << " " << element.getNazwisko() << endl;
        }
        students_file.close();
    }
}

void getStudentListAttendance() {	//Funkcja zczytująca z pliku informacje o historii obecności studentów
    fstream stud("attendance.txt", ios::in);
    string str, nick, history = "";
    int count, a = 1, b = 0;
    string znacznik = "***";
    if (stud.is_open()) {
        while (getline(stud, str)) {
            if(str == znacznik){
                baza[find(nick)].setHistory(history);
                history = "";
                b = 0;
                a = 1;
            }
            else if (a == 1) {
                nick = str;
                a = 0;
            }
            else if (b == 0) {
                count = stoi(str);
                baza[find(nick)].setAttendanceCount(count);
                b = 1;
            }
            else {
                history += str;
                history += "\n";
            }
        }
        stud.close();
    }
}

void setStudentListAttendance() { //Funkcja zapisująca aktualne informacje o historii obecności studentów do pliku
    fstream stud("attendance.txt", ios::out | ios::trunc);
    if (stud.is_open()) {
        for (auto element : baza) {
            stud << element.getLogin() << endl << element.getAttendanceCount() << endl << element.getHistory() << "***" << endl;
        }
        stud.close();
    }
}
admin Admin("admin", "admin");

void getAdminPassword() {	//funkcja pobierająca z pliku aktualne hasło admina
    fstream admin_password("admin.txt", ios::in);
    string password;
    if (admin_password.is_open()) {
        admin_password >> password;
        Admin.setPassword(password);
        admin_password.close();
    }
}

void setAdminPassword(string password) {	//Funkcja zapisująca do pliku hasło admina
    fstream admin_password("admin.txt", ios::out | ios::trunc);
    if (admin_password.is_open()) {
        admin_password << password;
        admin_password.close();
    }
}
char bin;

int StudentLogin() {	//Funkcja wyświetlająca i obsługująca menu logowania studenta
    system("cls");
    cout << "***Student Login***" << endl << endl;
    string login, password;
    cout << "Podaj login:" << endl;
    cin >> login;
    if (find(login) != -1) {
        cout << "Podaj haslo:" << endl;
        cin >> password;
        if (baza[find(login)].getPassword() == password) {
            baza[find(login)].view();
            return 0;
        }
        else {
            cout << "Bledne haslo, powrot do glownego menu\n\nNacisnij dowolny klawisz aby kontynuowac" << endl;
            bin = getchar();bin = getchar();
            return 0;
        }
    }
    else {
        cout << "Bledny login, powrot do glownego menu\n\nNacisnij dowolny klawisz aby kontynuowac" << endl;
        bin = getchar();bin = getchar();
        return 0;
    }
}

void admin::loginAdmin() {
    system("cls");
    cout << "***Admin Login***" << endl << endl;
    string login, password;
    cout << "Podaj login:" << endl;
    cin >> login;
    if (Admin.getLogin() == login) {
        cout << "Podaj haslo:" << endl;
        cin >> password;
        if (Admin.getPassword() == password) {
            Admin.view();
        }
        else {
            cout << "Bledne haslo, powrot do glownego menu\n\nNacisnij dowolny klawisz aby kontynuowac" << endl;
            bin = getchar();bin = getchar();
        }
    }
    else {
        cout << "Bledny login, powrot do glownego menu\n\nNacisnij dowolny klawisz aby kontynuowac" << endl;
        bin = getchar();bin = getchar();
    }
}

void admin::view() {
    bool back = false;
    while (1) {
        system("cls");
        cout << "***Admin Menu***" << endl << endl;
        cout << "[1] Zmien haslo" << endl;
        cout << "[2] Dodaj studenta" << endl;
        cout << "[3] Zmien haslo studenta" << endl;
        cout << "[4] Zmien obecnosc studenta" << endl;
        cout << "[5] Wyswietl liste studentow" << endl;
        cout << "[6] Wyswietl liste obecnosci studenta" << endl;
        cout << "[7] Wyswietl liste obecnosci wszystkich studentow" << endl;
        cout << "[0] Powrot do glownego menu" << endl;

        int wybor;
        cout << endl << "Wybierz:" << endl;
        cin >> wybor;
        while (cin.fail()) {
            cout << "Wprowadz liczbe" << endl;
            cin.clear();
            cin.ignore(256, '\n');
            cin >> wybor;
        }

        switch (wybor) {
        case 1: changePassword(); break;
        case 2: addStudent(); break;
        case 3: changeStudentPassword(); break;
        case 4: changeStudentAttendance(); break;
        case 5: showStudentList();; break;
        case 6: showStudentAttendance(); break;
        case 7: showAllAttendance(); break;
        case 0: back = true; break;
        default: cout << "Zly wybor \n\nNacisnij dowolny klawisz aby wrocic do menu" << endl; bin = getchar();bin = getchar(); break;
        }

        if (back) {
            break;
        }
    }
}

int admin::addStudent() {
    system("cls");
    string imie, nazwisko, login, password;
    cout << "***Dodawanie studenta***\nNacisnij - zeby anulowac" << endl<<endl;

    cout << "Podaj imie:" << endl;
    cin >> imie;
    if (imie == "-") return -1;
    cout << "Podaj nazwisko:" << endl;
    cin >> nazwisko;
    if (nazwisko == "-") return -1;
    cout << "Podaj login:" << endl;
    cin >> login;
    if (login == "-") return -1;
    cout << "Podaj haslo:" << endl;
    cin >> password;
    if (password == "-") return -1;

    if (find(login) == -1) {
        student s(imie, nazwisko, login, password);
        baza.push_back(s);
        setStudentList();
        cout << "Dodano studenta\n\nNacisnij dowolny klawisz aby wrocic do poprzedniego menu" << endl;
    }
    else {
        cout << "Student istnieje juz w bazie\n\nNacisnij dowolny klawisz aby wrocic do poprzedniego menu" << endl;
    }
    bin = getchar();bin = getchar();
    return 0;
}

int admin::changePassword() {
    system("cls");
    string password;
    cout << "***Zmiana hasla Admina***\nNacisnij - zeby anulowac" << endl << endl;

    cout << "Podaj nowe haslo:" << endl;
    cin >> password;
    if (password == "-") return -1;
    a_password = password;
    setAdminPassword(password);
    cout << "Zmieniono haslo\n\nNacisnij dowolny klawisz aby wrocic do poprzedniego menu" << endl;
    bin = getchar();bin = getchar();
    return 0;
}

int admin::changeStudentPassword() {
    system("cls");
    string login, password;
    cout<<"***Zmiana hasla Studenta***\nNacisnij - zeby anulowac" << endl << endl;

    cout << "Podaj login studenta, ktoremu chcesz zmienic haslo:" << endl;
    cin >> login;
    if (login == "-") return -1;
    if (find(login) != -1) {
        cout << "Podaj nowe haslo:" << endl;
        cin >> password;
        if (password == "-") return -1;
        baza[find(login)].setPassword(password);
        cout << "Zmieniono haslo\n\nNacisnij dowolny klawisz aby wrocic do poprzedniego menu" << endl;
        setStudentList();
        bin = getchar();bin = getchar();
    }
    else {
        cout << "Brak studenta w bazie\n\nNacisnij dowolny klawisz aby wrocic do poprzedniego menu" << endl;
        bin = getchar();bin = getchar();
    }
    return 0;
}

void admin::showStudentList() {
    system("cls");
    cout << "***Lista zarejestrowanych studentow***" << endl << endl;
    cout << "   Login\tImie\tNazwisko" << endl;
    int i = 1;
    for (auto element : baza) {
        cout << i << ". " << element.getLogin() << " " << element.getImie() << " " << element.getNazwisko() << endl;
        i++;
    }
    cout << "\n\nNacisnij dowolny klawisz aby wrocic do poprzedniego menu" << endl;
    bin = getchar();bin = getchar();
}

void admin::showStudentAttendance() {
    system("cls");
    string login;
    cout << "***Obecnosc studenta***" << endl << endl;

    cout << "Podaj login studenta, ktorego obecnosc chcesz wyswietlic:" << endl;
    cin >> login;
    if (find(login) != -1) {
        cout << "Obecnosc studenta " << baza[find(login)].getImie() << " " << baza[find(login)].getNazwisko() << endl;
        baza[find(login)].viewHistory();

        cout << "\n\nNacisnij dowolny klawisz aby wrocic do poprzedniego menu" << endl;
        bin = getchar();bin = getchar();
    }
    else {
        cout<<"Brak studenta w bazie\n\nNacisnij dowolny klawisz aby wrocic do poprzedniego menu" << endl;
        bin = getchar();bin = getchar();
    }
}

void admin::showAllAttendance() {
    system("cls");
    cout << "***Obecnosc studentow***" << endl << endl;

    int i = 1;
    for (auto element : baza) {
        cout << i << ". " << element.getImie() << " " << element.getNazwisko() << endl;
        element.viewHistory();
        i++;
    }

    cout << "\n\nNacisnij dowolny klawisz aby wrocic do poprzedniego menu" << endl;
    bin = getchar();bin = getchar();
}

int admin::changeStudentAttendance() {
    system("cls");
    string login;
    cout << "***Zmiana obecnosci Studenta***\nNacisnij - zeby anulowac" << endl << endl;

    cout << "Podaj login studenta, ktoremu chcesz zmienic obecnosc:" << endl;
    cin >> login;
    if (login == "-") return -1;
    if (find(login) != -1) {
        cout << "Jaka obecnosc ustawic? \nT/t Obecny\nN/n Nieobecny\nNacisnij - zeby anulowac" << endl;
        char wybor;
        cin >> wybor;
        if (wybor == 'T' || wybor == 't') {
            if (baza[find(login)].getAttendance() == false) {
                baza[find(login)].setAttendance(true);
                baza[find(login)].setAttendanceCount(baza[find(login)].getAttendanceCount() + 1);
                time_t rawtime;
                time(&rawtime);
                struct tm timeinfo;
                localtime_s(&timeinfo, &rawtime);
                string str = to_string(timeinfo.tm_mday) + "." + to_string(1 + timeinfo.tm_mon) + "." + to_string(1900 + timeinfo.tm_year) + "\n";
                baza[find(login)].setHistory(baza[find(login)].getHistory() + str);
                cout << "Zmieniono obecnosc\n\nNacisnij dowolny klawisz aby wrocic do poprzedniego menu" << endl;
                bin = getchar();bin = getchar();
                setStudentListAttendance();
            }
            else {
                cout << "Student ma juz ustawiona taka obecnosc\n\nNacisnij dowolny klawisz aby wrocic do poprzedniego menu" << endl;
                bin = getchar();bin = getchar();
            }
        }
        else if (wybor == 'N' || wybor == 'n') {
            if (baza[find(login)].getAttendance() == true) {
                baza[find(login)].setAttendance(false);
                baza[find(login)].setAttendanceCount(baza[find(login)].getAttendanceCount() - 1);
                time_t rawtime;
                time(&rawtime);
                struct tm timeinfo;
                localtime_s(&timeinfo, &rawtime);
                string str = to_string(timeinfo.tm_mday) + "." + to_string(1 + timeinfo.tm_mon) + "." + to_string(1900 + timeinfo.tm_year) + "\n";
                size_t pos = baza[find(login)].getHistory().find(str);
                string history = baza[find(login)].getHistory();
                history.erase(pos,str.size());
                baza[find(login)].setHistory(history);
                cout << "Zmieniono obecnosc\n\nNacisnij dowolny klawisz aby wrocic do poprzedniego menu" << endl;
                bin = getchar();bin = getchar();
                setStudentListAttendance();
            }
            else {
                cout << "Student ma juz ustawiona taka obecnosc\n\nNacisnij dowolny klawisz aby wrocic do poprzedniego menu" << endl;
                bin = getchar();bin = getchar();
            }
        }
        else if (wybor == '-') {
            return -1;
        }
        else {
            cout << "Zly wybor \n\nNacisnij dowolny klawisz aby wrocic do menu" << endl; 
            bin = getchar();bin = getchar();
            return -1;
        }
    }
    else {
        cout << "Brak studenta w bazie\n\nNacisnij dowolny klawisz aby wrocic do poprzedniego menu" << endl;
        bin = getchar();bin = getchar();
    }
    return 0;
}

void student::view() {
    bool back = false;
    while (1) {
        system("cls");
        cout << "***Student Menu***" << endl << endl;
        cout << "[1] Zmien haslo" << endl;
        cout << "[2] Zaznacz obecnosc" << endl;
        cout << "[3] Wyswietl historie obecnosci" << endl;
        cout << "[0] Powrot do glownego menu" << endl;

        int wybor;
        cout << endl << "Wybierz:" << endl;
        cin >> wybor;
        while (cin.fail()) {
            cout << "Wprowadz liczbe" << endl;
            cin.clear();
            cin.ignore(256, '\n');
            cin >> wybor;
        }

        switch (wybor) {
        case 1: changePassword(); break;
        case 2: markAttendance(); break;
        case 3: system("cls"); cout << "***Twoja obecnosc***" << endl << endl; viewHistory();
            cout << "\n\nNacisnij dowolny klawisz aby wrocic do poprzedniego menu" << endl;
            bin = getchar();bin = getchar(); break;
        case 0: back = true; break;
        default: cout << "Zly wybor \n\nNacisnij dowolny klawisz aby wrocic do menu" << endl; bin = getchar();bin = getchar(); break;
        }

        if (back) {
            break;
        }
    }
}

int student::changePassword() {
    system("cls");
    string password;
    cout << "***Zmiana hasla***\nNacisnij - zeby anulowac" << endl << endl;

    cout << "Podaj nowe haslo:" << endl;
    cin >> password;
    if (password == "-") return -1;
    s_password = password;
    cout << "Zmieniono haslo\n\nNacisnij dowolny klawisz aby wrocic do poprzedniego menu" << endl;
    setStudentList();
    bin = getchar();bin = getchar();
    return 0;
}

void student::markAttendance() {
    system("cls");
    cout << "***Rejestrowanie obecnosci***" << endl << endl;
    if (today_attendance) {
        cout << "Zarejestrowales/as juz swoja obecnosc\n\nNacisnij dowolny klawisz aby wrocic do poprzedniego menu" << endl;
    }
    else {
        today_attendance = true;
        s_attendance_count++;
        time_t rawtime;
        time(&rawtime);
        struct tm timeinfo;
        localtime_s(&timeinfo, &rawtime);
        string str = to_string(timeinfo.tm_mday) + "." + to_string(1 + timeinfo.tm_mon) + "." + to_string(1900 + timeinfo.tm_year) + "\n";
        s_history += str;
        cout<<"Zarejestrowales/as swoja obecnosc\n\nNacisnij dowolny klawisz aby wrocic do poprzedniego menu" << endl;
        setStudentListAttendance();
    }
    bin = getchar();bin = getchar();
}

void student::viewHistory() {
    cout << "Dzisiejsza obecnosc: ";
    if (today_attendance) {
        cout << "Tak" << endl;
    }
    else {
        cout << "Nie" << endl;
    }
    cout << "Sumaryczna liczba obecnosci: " << s_attendance_count << endl;
    cout << "Obecny/a w dniach:" << endl;
    cout << s_history;
}

int main()
{
    getAdminPassword();
    getStudentList();
    getStudentListAttendance();

    while (1) {
        system("cls");
        cout << "***System obecnosci***" << endl << endl;
        cout << "[1] Student Login" << endl;
        cout << "[2] Admin Login" << endl;
        cout << "[0] Exit" << endl;

        int wybor;
        cout << endl << "Wybierz:" << endl;
        cin >> wybor;
        while (cin.fail()) {
            cout << "Wprowadz liczbe" << endl;
            cin.clear();
            cin.ignore(256, '\n');
            cin >> wybor;
        }
        switch (wybor) {
        case 1: StudentLogin(); break;
        case 2: Admin.loginAdmin(); break;
        case 0: return 0; break;
        default: cout<<"Zly wybor\n\nNacisnij dowolny klawisz aby wrocic do menu" << endl; bin = getchar();bin = getchar(); break;
        }
    }

    return 0;
}