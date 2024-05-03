public class AgendadorDeletarOrdersAntigas implements Schedulable {
    public void execute(SchedulableContext ctx) {
        DeletarOrdersAntigas deletarOrders = new DeletarOrdersAntigas();
        deletarOrders.execute(ctx);
    }
}
