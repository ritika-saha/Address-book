import java.util.ArrayList;
import java.util.Scanner;




class AddressBook {

    private ArrayList<contact> contactList;

    public AddressBook() {
        contactList = new ArrayList<contact>();
    }

     public void display() {
        if (contactList.isEmpty()) {
            System.out.println("No contacts in the address book");
        } else {
            System.out.println("---------------------------------------------------------------");
            System.out.println( "NAME  \t\t\tADDRESS  \t\tCITY  \t\tSTATE \t\tZIP  \t\tPHONE NUMBER  \t\tEMAIL");
            for(int i=0;i<contactList.size();i++){
                  String fname=contactList.get(i).getFname();
                 String lname=contactList.get(i).getLname();
                 String address=contactList.get(i).getAddress();
                 String city=contactList.get(i).getCity();
                 String zip=contactList.get(i).getZip();
                 String state=contactList.get(i).getState();
                 String phone=contactList.get(i).getPhone();
                 String email=contactList.get(i).getEmail();
                System.out.printf( "%s %s  \t\t %s  \t\t%s  \t\t\t %s \t\t %s  \t\t %s  \t %s\n",
                fname, lname, address, city, state, zip, phone, email);
            }
        }

    }

    public void addAddress(contact c) {
        contactList.add(c);
        System.out.println("Contact added successfully");
        display();

    }

   

}
