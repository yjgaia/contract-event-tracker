import { SupabaseConnector } from "@common-module/supabase";
class ContractEventTracker {
    async trackEvents(chain, contract, blockPeriod) {
        await SupabaseConnector.callEdgeFunction("api/contract/track-events", {
            chain,
            contract,
            blockPeriod,
        });
    }
}
export default new ContractEventTracker();
//# sourceMappingURL=ContractEventTracker.js.map