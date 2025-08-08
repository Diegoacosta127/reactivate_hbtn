void main() {
    List<String> shoppingList = ["milk", "bread", "eggs"];
    shoppingList.add("cheese");
    shoppingList.add("butter");
    shoppingList.remove("bread");
    for(var item in shoppingList) print(item);
}
