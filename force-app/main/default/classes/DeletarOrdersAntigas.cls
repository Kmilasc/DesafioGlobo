public class DeletarOrdersAntigas implements Schedulable {
    public void execute(SchedulableContext ctx) {
        Date dataLimite = Date.today().addMonths(-3);
        List<Order> ordersParaDeletar = [SELECT Id FROM Order WHERE LastModifiedDate < :dataLimite];
        delete ordersParaDeletar;
    }
}