export interface ZayedOptions {
    enableProtection?: boolean;
    watermarkText?: string;
    language?: 'ar' | 'en';
}

declare class ZayedCyberShield {
    constructor(options?: ZayedOptions);
    init(): void;
    getStatus(): object;
}

export default ZayedCyberShield;
