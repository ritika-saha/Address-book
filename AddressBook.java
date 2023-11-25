import java.util.ArrayList;
import java.util.Scanner;

class contact {
    private String fname;
    private String lname;
    private String address;
    private String city;
    private String zip;
    private String state;
    private String phone;
    private String email;

    public contact(String fname, String lname, String address, String city, String state, String zip, String phone,
            String email) {
        this.fname = fname;
        this.lname = lname;
        this.address = address;
        this.city = city;
        this.zip = zip;
        this.state = state;
        this.phone = phone;
        this.email = email;
    }

    public String getFname() {
        return fname;
    }

    public String getLname() {
        return lname;
    }

    public String getAddress() {
        return address;
    }

    public String getCity() {
        return city;
    }

    public String getState() {
        return state;
    }

    public String getZip() {
        return zip;
    }

    public String getPhone() {
        return phone;
    }

    public String getEmail() {
        return email;
    }

    public void updateContact(String address, String city, String state, String zip, String phone, String email) {
        this.address = address;
        this.city = city;
        this.state = state;
        this.zip = zip;
        this.phone = phone;
        this.email = email;
    }

}



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
                System.out.printf( "%s %s  \t\t\t %s  \t\t%s  \t\t %s \t\t %s  \t\t %s  \t\t %s\n",
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
