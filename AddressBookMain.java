import java.util.Scanner;
public class AddressBookMain {

    public static void main(String[] args){
        System.out.println("----------------Welcome to Address Book Program--------------");

        //createContact branch to create contact
        Scanner sc=new Scanner(System.in);
        //addContacts branch to add
        contact c1=new contact("ritika", "saha", "fgrg", "fdrfg", "frgerg", "32423", "234324324", "dfbhsfd");
        AddressBook ab1=new AddressBook();
        ab1.addAddress(c1);
        int choice=-1;
        System.out.println("Enter 1 to add contact");
        System.out.println("enter 0 to exit");
        choice=sc.nextInt();
        sc.nextLine();
        while(choice!=0){
            if(choice==1){
                 System.out.println("enter first and last names, address, city, state, zip, phone number and email...");
                 String fname=sc.nextLine();
                 String lname=sc.nextLine();
                 String address=sc.nextLine();
                 String city=sc.nextLine();
                 String zip=sc.nextLine();
                 String state=sc.nextLine();
                 String phone=sc.nextLine();
                 String email=sc.nextLine();
                 contact c=new contact(fname, lname, address, city, state, zip, phone, email);
                 ab1.addAddress(c);

                 System.out.println("Enter 1 to add contact");
        System.out.println("enter 0 to exit");
        choice=sc.nextInt();
        sc.nextLine();

            }

            else if(choice==0)
            break;
        }
        
        
    }
}