CREATE TABLE IF NOT EXISTS "public"."contract_events" (
    "chain" "text" NOT NULL,
    "contract" "text" NOT NULL,
    "block" bigint NOT NULL,
    "log_index" bigint NOT NULL,
    "tx" "text" NOT NULL,
    "event" "text" NOT NULL,
    "args" "text"[] DEFAULT '{}'::"text"[] NOT NULL,
    "created_at" timestamp with time zone DEFAULT "now"() NOT NULL
);

ALTER TABLE "public"."contract_events" OWNER TO "postgres";

ALTER TABLE ONLY "public"."contract_events"
    ADD CONSTRAINT "contract_events_pkey" PRIMARY KEY ("chain", "contract", "block", "log_index");

ALTER TABLE "public"."contract_events" ENABLE ROW LEVEL SECURITY;

CREATE POLICY "view everyone" ON "public"."contract_events" FOR SELECT USING (true);

GRANT ALL ON TABLE "public"."contract_events" TO "anon";
GRANT ALL ON TABLE "public"."contract_events" TO "authenticated";
GRANT ALL ON TABLE "public"."contract_events" TO "service_role";
