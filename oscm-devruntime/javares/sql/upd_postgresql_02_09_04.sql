CREATE TABLE "tenant" (
		"tkey" BIGINT NOT NULL,
		"version" INTEGER DEFAULT 0 NOT NULL,
		"tenantid" character varying(255) NOT NULL,
		"description" character varying(255),
		"idp" character varying(255)
	);
ALTER TABLE "tenant" ADD CONSTRAINT "tenant_pk" PRIMARY KEY ("tkey");

ALTER TABLE "marketplace" ADD COLUMN "tenant_tkey" BIGINT;

ALTER TABLE "marketplace" ADD CONSTRAINT "marketplace_tenant_fk" FOREIGN KEY ("tenant_tkey")
	REFERENCES "tenant" ("tkey");

ALTER TABLE "organization" ADD COLUMN "tenant_tkey" BIGINT;

ALTER TABLE "organization" ADD CONSTRAINT "organization_tenant_fk" FOREIGN KEY ("tenant_tkey")
  REFERENCES "tenant" ("tkey");

ALTER TABLE "platformuser" ADD COLUMN "tenant_tkey" BIGINT;

ALTER TABLE "platformuser" ADD CONSTRAINT "platformuser_tenant_fk" FOREIGN KEY ("tenant_tkey")
    REFERENCES "tenant" ("tkey");

ALTER TABLE "platformuser" ADD CONSTRAINT "pl_userid_tenantkey_uk" UNIQUE ("userid", "tenant_tkey");