import java.util.Scanner;

public class AddressBookMain {
    public static void main(String[] args) {
        System.out.println("----------------Welcome to Address Book Program--------------");

        Scanner sc = new Scanner(System.in);
        AddressBook ab1 = new AddressBook();
        int choice = -1;

        while (choice != 0) {
            System.out.println("Enter 1 to add contact");
            System.out.println("Enter 2 to edit contact");
            System.out.println("Enter 3 to delete contact");
            System.out.println("Enter 0 to exit");

            try {
                choice = sc.nextInt();
                sc.nextLine(); // Consume the newline character

                switch (choice) {
                    case 1:
                        System.out.println("Enter first and last names, address, city, state, zip, phone number, and email...");
                        String fname = sc.nextLine();
                        String lname = sc.nextLine();
                        String address = sc.nextLine();
                        String city = sc.nextLine();
                        String zip = sc.nextLine();
                        String state = sc.nextLine();
                        String phone = sc.nextLine();
                        String email = sc.nextLine();
                        contact c = new contact(fname, lname, address, city, state, zip, phone, email);
                        ab1.addAddress(c);
                        break;

                    case 2:
                        System.out.println("Enter the firstname and lastname of person you want to edit");
                        String fn = sc.nextLine();
                        String ln = sc.nextLine();
                        ab1.editAddress(fn, ln);
                        break;

                    case 3:System.out.println("Enter the firstname and lastname of person you want to edit");
                        String fn1 = sc.nextLine();
                        String ln1 = sc.nextLine();
                        ab1.deleteAddress(fn1, ln1);

                    case 0:
                        break;

                    default:
                        System.out.println("Invalid choice. Please enter a valid option.");
                }

            } catch (java.util.InputMismatchException e) {
                System.out.println("Invalid input. Please enter a valid number.");
                sc.nextLine(); // Consume the invalid input
            }
        }
    }
}
