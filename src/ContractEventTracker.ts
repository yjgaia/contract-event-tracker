import { SupabaseConnector } from "@common-module/supabase";

class ContractEventTracker {
  public async trackEvents(
    chain: string,
    contract: string,
    blockPeriod?: number,
  ) {
    await SupabaseConnector.callFunction("api/contract/track-events", {
      chain,
      contract,
      blockPeriod,
    });
  }
}

export default new ContractEventTracker();
