package no.fdk.searchapi.configuration;

import no.dcat.client.referencedata.ReferenceDataClient;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
@EnableAutoConfiguration
public class ApplicationConfiguration {

    @Bean
    ReferenceDataClient referenceDataClient() {
        return new ReferenceDataClient();
    }

}
