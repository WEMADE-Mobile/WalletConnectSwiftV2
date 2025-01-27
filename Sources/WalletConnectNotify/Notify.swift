import Foundation

public class Notify {
    public static var instance: NotifyClient = {
        guard let config = Notify.config else {
            fatalError("Error - you must call Notify.configure(_:) before accessing the shared wallet instance.")
        }
        Push.configure(pushHost: config.pushHost, environment: config.environment)
        return NotifyClientFactory.create(
            projectId: Networking.projectId,
            groupIdentifier: config.groupIdentifier,
            networkInteractor: Networking.interactor,
            pairingRegisterer: Pair.registerer,
            pushClient: Push.instance,
            crypto: config.crypto,
            notifyHost: config.notifyHost,
            explorerHost: config.explorerHost
        )
    }()

    private static var config: Config?

    private init() { }

    /// Wallet's configuration method
    static public func configure(
        pushHost: String = "echo.walletconnect.com",
        groupIdentifier: String,
        environment: PushEnvironment,
        crypto: CryptoProvider,
        notifyHost: String = "notify.walletconnect.com",
        explorerHost: String = "explorer-api.walletconnect.com"
    ) {
        Notify.config = Notify.Config(pushHost: pushHost, groupIdentifier: groupIdentifier, environment: environment, crypto: crypto, notifyHost: notifyHost, explorerHost: explorerHost)
    }

}
